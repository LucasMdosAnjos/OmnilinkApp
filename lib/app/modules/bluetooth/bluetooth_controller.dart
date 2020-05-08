import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';
import 'dart:convert' show utf8;
part 'bluetooth_controller.g.dart';

class BluetoothController = _BluetoothControllerBase with _$BluetoothController;

abstract class _BluetoothControllerBase with Store {
  FlutterBlue flutterBlue;
  StreamSubscription subscription;
  ScrollController scroll = ScrollController();
  @observable
  BuildContext context;
  @observable
  BluetoothCharacteristic writeCharac;
  @observable
  String ultimaRequisicaoMsgFormatada = "";
  @observable
  int value = 0;
  @observable
  var devices = ObservableList<Widget>();
  @observable
  String connectedDevice = "";
  @observable
  ScanResult resultDevice;
  @observable
  bool showLoading = false;
  @observable
  int selectedOption = 15;
  @observable
  var widgets = ObservableList<Widget>();
  @observable
  var serialData = ObservableList<String>();
  @observable
  bool expandPanelOptions = true;

  Map<int, String> mapOptions = {
    0: 'Mensagens Formatadas',
    1: 'Mensagens Predefinidas',
    2: 'Mensagens Livres',
    3: 'Mensagens Modal',
    4: 'Mensagens Diálogo',
    5: 'Mensagens Personalizadas',
    6: 'Estado do Veículo',
    7: 'Menus'
  };
  Map<int, String> mapPictures = {
    0: 'assets/mensg_format_bt.png',
    1: 'assets/mensg_predef_bt.png',
    2: 'assets/mensag_livres_bt.png',
    3: 'assets/mensag_modal_bt.png',
    4: 'assets/mensg_dialogo_bt.png',
    5: 'assets/mensag_persona_bt.png',
    6: 'assets/estado_veiculo_bt.png',
    7: 'assets/menu_bt.png'
  };

  _BluetoothControllerBase() {
    flutterBlue = FlutterBlue.instance;
    scanDevices();
  }

  @action
  void setContext(BuildContext ctx) {
    context = ctx;
  }

  void scanDevices() {
    flutterBlue.startScan(timeout: Duration(seconds: 4));
    subscription = flutterBlue.scanResults.listen((results) {
      // do something with scan results
      print(results.length);
      if (results.isNotEmpty) {
        addWidgetsDevices(results);
      }
    });
  }

  @action
  void addWidgetsDevices(List<ScanResult> results) {
    devices.clear();
    results.sort((r1, r2) {
      if (r1.rssi < r2.rssi) {
        return 1;
      } else {
        return -1;
      }
    });
    ScanResult r = results[0];
    results.forEach((f) => print(f.rssi));
    print('${r.device.name} found! rssi: ${r.rssi}');
    devices.add(Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          '${r.device.name}, RSSI: ${r.rssi}',
          style: GoogleFonts.robotoMono(
              fontSize: 17,
              letterSpacing: 2.0,
              color: Colors.lightGreen[700],
              fontWeight: FontWeight.w400),
        ),
        SizedBox(
          width: 20.0,
        ),
        RaisedButton(
          color: Colors.blueGrey,
          onPressed: () async {
            if (connectedDevice == "") {
              showLoading = true;
              Future.delayed(Duration(seconds: 3)).then((_) {
                showLoading = false;
              });
              resultDevice = r;
              await r.device.connect();
              connectedDevice = r.device.name;
              List<BluetoothService> services =
                  await r.device.discoverServices();
              services.forEach((service) async {
                if (service.uuid.toString().toUpperCase() ==
                    "2456E1B9-26E2-8F83-E744-F34F01E9D701") {
                  print("Serviço: " + service.uuid.toString());
                  var characteristics = service.characteristics;
                  for (BluetoothCharacteristic c in characteristics) {
                    print(c.uuid);
                    if (c.uuid.toString().toUpperCase() ==
                        '2456E1B9-26E2-8F83-E744-F34F01E9D704') {
                      writeCharac = c;
                    }
                    if (c.uuid.toString().toUpperCase() ==
                        '2456E1B9-26E2-8F83-E744-F34F01E9D703') {
                      await c.setNotifyValue(true);
                      c.value.listen((value) async {
                        if (writeCharac != null) {
                          print(serialData.length);
                          print(widgets.length);
                          serialData.add(utf8.decode(value));
                          await updateWidgets();
                          print(serialData.length);
                          print(widgets.length);
                          print("--------------/------------");
                        }
                      });
                    }
                  }
                }
              });
              addWidgetsDevices(results);
            } else {
              await r.device.disconnect();
              connectedDevice = "";
              selectedOption = 15;
              widgets.clear();
              serialData.clear();
              addWidgetsDevices(results);
            }
          },
          child: Text(
              connectedDevice == r.device.name ? "Desconectar" : "Conectar"),
        ),
      ],
    ));
  }

  @action
  void increment() {
    value++;
  }

  @action
  void setPanelExpand() {
    expandPanelOptions = !expandPanelOptions;
  }

  @action
  void setOption(int option) {
    selectedOption = option;
  }

  @action
  Future<void> updateWidgets() async {
    widgets.clear();
    if (selectedOption != 15) {
      switch (selectedOption) {
        case 0:
          for (int i = 0; i < serialData.length; i++) {
            String line = serialData[i];
            if (line.contains("MFRMINIT")) {
              if (line == "MFRMINIT,0,0") {
                widgets.add(Card(
                  elevation: 6.0,
                  margin: const EdgeInsets.symmetric(
                    vertical: 30.0,
                    horizontal: 24.0,
                  ),
                  child: Container(
                    height: 160.0,
                    width: 560.0,
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                                stops: [
                                  0.05,
                                  0.1,
                                  0.7,
                                  0.9,
                                  1
                                ],
                                colors: [
                                  Colors.blue,
                                  Colors.blue[400],
                                  Colors.blue[300],
                                  Colors.blue[400],
                                  Colors.blue,
                                ]),
                          ),
                        ),
                        Transform.translate(
                          child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(180.0),
                                  border: Border.all(
                                      color: Colors.red, width: 1.5)),
                              child: Icon(
                                Icons.trending_down,
                                size: 60,
                                color: Colors.red,
                              )),
                          offset: Offset(15, -25),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              "Central para envio de mensagens formatadas não configurada.",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.robotoMono(
                                  fontSize: 18.5,
                                  letterSpacing: 2.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ));
              } else {
                int num = int.tryParse(line.split(',')[1]);
                int indice = int.tryParse(line.split(',')[2]);
                if ('MFRM,$indice' != ultimaRequisicaoMsgFormatada) {
                  await writeCharac.write(utf8.encode('MFRM,$indice'));
                  ultimaRequisicaoMsgFormatada = 'MFRM,$indice';
                }
                widgets.add(Card(
                  margin: const EdgeInsets.symmetric(
                    vertical: 30.0,
                    horizontal: 24.0,
                  ),
                  elevation: 6.0,
                  child: Container(
                    height: 160.0,
                    width: 560.0,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                          stops: [
                            0.05,
                            0.1,
                            0.7,
                            0.9,
                            1
                          ],
                          colors: [
                            Colors.blue,
                            Colors.blue[400],
                            Colors.blue[300],
                            Colors.blue[400],
                            Colors.blue,
                          ]),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Número de mensagens formatadas no veículo: $num.\nÍndice da mensagem: $indice",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.robotoMono(
                                fontSize: 18.5,
                                letterSpacing: 2.0,
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
                  ),
                ));
              }
            }
            if (line.contains("MFRM,")) {
              String titulo = line.split(',')[1].trim();
              int indiceMensagem =
                  int.parse(ultimaRequisicaoMsgFormatada.split(',')[1]);
              widgets.add(Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 30.0,
                  horizontal: 24.0,
                ),
                width: 600,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        stops: [
                          0.05,
                          0.1,
                          0.7,
                          0.9,
                          1
                        ],
                        colors: [
                          Colors.yellow,
                          Colors.yellow[300],
                          Colors.yellow[200],
                          Colors.yellow[300],
                          Colors.yellow,
                        ]),
                    borderRadius: BorderRadius.circular(8.0)),
                child: Column(
                  children: <Widget>[
                    Transform.translate(
                      child: Container(
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(180.0),
                              border:
                                  Border.all(color: Colors.green, width: 1.5)),
                          child: Icon(
                            Icons.email,
                            size: 60,
                            color: Colors.blue,
                          )),
                      offset: Offset(15, -40),
                    ),
                    Text(
                      'Título da Mensagem Formatada:',
                      style: GoogleFonts.robotoMono(
                          fontSize: 20.0,
                          letterSpacing: 2.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '$titulo',
                        textAlign: TextAlign.left,
                        style: GoogleFonts.robotoMono(
                            fontSize: 23.0,
                            letterSpacing: 2.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    RaisedButton(
                      color: Colors.blue[800],
                      onPressed: () {
                        showCupertinoDialog(
                            context: context,
                            builder: (_) {
                              return CupertinoAlertDialog(
                                title: Text(
                                  'Solicitação',
                                  style: GoogleFonts.sourceCodePro(
                                      wordSpacing: 1.5,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18.0),
                                ),
                                content: Text(
                                  'Solicitar campos do formulário?',
                                  style: GoogleFonts.sourceCodePro(
                                      wordSpacing: 1.5,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w300),
                                ),
                                actions: <Widget>[
                                  FlatButton(
                                    onPressed: () {
                                      Modular.to.pop();
                                    },
                                    child: Text(
                                      'CANCELAR',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ),
                                  FlatButton(
                                    onPressed: () {
                                      writeCharac.write(utf8
                                          .encode('MFRMDATA,$indiceMensagem'));
                                      Modular.to.pop();
                                    },
                                    child: Text(
                                      'OK',
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                  ),
                                ],
                              );
                            });
                      },
                      child: Text('Solicitar formulário'),
                    ),
                  ],
                ),
              ));
            }
            if (line == ('MFRMCF')) {
              widgets.add(Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 30.0,
                  horizontal: 24.0,
                ),
                width: 600,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        stops: [
                          0.05,
                          0.1,
                          0.7,
                          0.9,
                          1
                        ],
                        colors: [
                          Colors.lightGreen,
                          Colors.lightGreen[400],
                          Colors.lightGreen[200],
                          Colors.lightGreen[300],
                          Colors.lightGreen,
                        ]),
                    borderRadius: BorderRadius.circular(8.0)),
                child: Column(
                  children: <Widget>[
                    Transform.translate(
                      child: Container(
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(180.0),
                              border:
                                  Border.all(color: Colors.red, width: 2.5)),
                          child: Icon(
                            Icons.warning,
                            size: 60,
                            color: Colors.blue,
                          )),
                      offset: Offset(15, -40),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Fim do envio de todos os campos da Mensagem.',
                        textAlign: TextAlign.left,
                        style: GoogleFonts.robotoMono(
                            fontSize: 23.0,
                            letterSpacing: 2.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                  ],
                ),
              ));
            }
            if (line == "MRPREV,0") {
              widgets.add(Container(
                width: 600,
                margin: const EdgeInsets.symmetric(
                  vertical: 30.0,
                  horizontal: 24.0,
                ),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        stops: [
                          0.05,
                          0.1,
                          0.7,
                          0.9,
                          1
                        ],
                        colors: [
                          Colors.lightGreen,
                          Colors.lightGreen[400],
                          Colors.lightGreen[200],
                          Colors.lightGreen[300],
                          Colors.lightGreen,
                        ]),
                    borderRadius: BorderRadius.circular(8.0)),
                child: Column(
                  children: <Widget>[
                    Transform.translate(
                      child: Container(
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(180.0),
                              border:
                                  Border.all(color: Colors.red, width: 2.5)),
                          child: Icon(
                            Icons.warning,
                            size: 60,
                            color: Colors.blue,
                          )),
                      offset: Offset(15, -40),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Não há mais mensagens predefinidas.',
                        textAlign: TextAlign.left,
                        style: GoogleFonts.robotoMono(
                            fontSize: 23.0,
                            letterSpacing: 2.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                  ],
                ),
              ));
            }
            if (line == "MRPREV,1") {
              widgets.add(Container(
                width: 600,
                margin: const EdgeInsets.symmetric(
                  vertical: 30.0,
                  horizontal: 24.0,
                ),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        stops: [
                          0.05,
                          0.1,
                          0.7,
                          0.9,
                          1
                        ],
                        colors: [
                          Colors.lightGreen,
                          Colors.lightGreen[400],
                          Colors.lightGreen[200],
                          Colors.lightGreen[300],
                          Colors.lightGreen,
                        ]),
                    borderRadius: BorderRadius.circular(8.0)),
                child: Column(
                  children: <Widget>[
                    Transform.translate(
                      child: Container(
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(180.0),
                              border:
                                  Border.all(color: Colors.red, width: 2.5)),
                          child: Icon(
                            Icons.warning,
                            size: 60,
                            color: Colors.blue,
                          )),
                      offset: Offset(15, -40),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Há mais mensagens predefinidas para serem lidas abaixo.',
                        textAlign: TextAlign.left,
                        style: GoogleFonts.robotoMono(
                            fontSize: 23.0,
                            letterSpacing: 2.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                  ],
                ),
              ));
            }
          }
          scroll.jumpTo(scroll.position.maxScrollExtent + 1500);
          break;
        default:
          widgets.clear();
          break;
      }
    }
  }

  @action
  void changeSegmentedOption(int option) {
    widgets.clear();
    switch (option) {
      case 0:
        if (writeCharac != null) {
          writeCharac.write(utf8.encode("MFRMINIT"));
          print('OPAAA');
          updateWidgets();
        }
        break;
      default:
        widgets.clear();
        break;
    }
  }
}
