import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobx/mobx.dart';
import 'package:usb_serial/transaction.dart';
import 'package:usb_serial/usb_serial.dart';

part 'usb_controller.g.dart';

class UsbController = _UsbControllerBase with _$UsbController;

abstract class _UsbControllerBase with Store {
  AnimationController controllerAnimation;
  Animation<double> opacity;
  Animation<double> offset;
  ScrollController scroll = ScrollController();

  @observable
  String status = "Idle";
  @observable
  var ports = ObservableList<Widget>();
  @observable
  var serialData = ObservableList<String>();
  @observable
  int deviceId;
  @observable
  var widgets = ObservableList<Widget>();
  UsbPort port;
  StreamSubscription<String> subscription;
  Transaction<String> transaction;

  @observable
  bool showClock = false;
  @observable
  int selectedOption = 15;
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

  @action
  void setClock(bool value) {
    showClock = value;
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
  void changeSegmentedOption(int option) {
    widgets.clear();
    switch (option) {
      case 0:
        serialData.forEach((line) {
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
                                border:
                                    Border.all(color: Colors.red, width: 1.5)),
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
              int num = int.parse(line.split(',')[1]);
              int indice = int.parse(line.split(',')[2]);
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
                            border: Border.all(color: Colors.red, width: 2.5)),
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
                            border: Border.all(color: Colors.red, width: 2.5)),
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
                            border: Border.all(color: Colors.red, width: 2.5)),
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
        });
        scroll.jumpTo(scroll.position.maxScrollExtent + 1500);
        break;
      default:
        widgets.clear();
        break;
    }
  }

  @action
  void addSerial(String text) {
    serialData.add(text);
    if (status == "Connected") {
      changeSegmentedOption(selectedOption);
    }
  }

  @action
  void clearSerialData() {
    serialData.clear();
  }

  void cancelSubscription() {
    subscription.cancel();
    subscription = null;
  }

  void cancelTransaction() {
    transaction.dispose();
    transaction = null;
  }

  void cancelPort() {
    port.close();
    port = null;
  }

  @action
  void nullDeviceId() {
    deviceId = null;
  }

  @action
  void changeStatus(String msg) {
    status = msg;
  }

  Future createDevice(device) async {
    port = await device.create();
  }

  @action
  Future setPortConfigs() async {
    await port.setDTR(true);
    await port.setRTS(true);
    await port.setPortParameters(
        115200, UsbPort.DATABITS_8, UsbPort.STOPBITS_1, UsbPort.PARITY_NONE);
  }

  @action
  void setDeviceId(device) {
    deviceId = device.deviceId;
  }

  @action
  void listenSerial() {
    transaction = Transaction.stringTerminated(
        port.inputStream, Uint8List.fromList([13, 10]));

    subscription = transaction.stream.listen((String line) {
      serialData.add(line.trim());
      addSerial(line.trim());
    });
  }

  @action
  void addPort() {
    ports.clear();
    ports.add(Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'UART, BRIDGE SILICOM',
          style: GoogleFonts.robotoMono(
              fontSize: 17,
              letterSpacing: 2.0,
              color: Colors.lightGreen[700],
              fontWeight: FontWeight.w400),
        ),
        SizedBox(width: 20.0,),
        RaisedButton(
          color: Colors.blueGrey,
          onPressed: () {},
          child: Text('Desconectar'),
        ),
      ],
    ));
  }

  @action
  void buildWidgetPorts(List<UsbDevice> devices) {
    ports.clear();
    devices.forEach((device) {
      // ports.add(ListTile(
      //     leading: Icon(Icons.usb),
      //     title: Text(device.productName),
      //     subtitle: Text(device.manufacturerName),
      //     trailing: RaisedButton(
      //       child: Text(deviceId == device.deviceId ? "Desconectar" : "Conectar"),
      //       onPressed: () {
      //         connectTo(deviceId == device.deviceId ? null : device)
      //             .then((res) {
      //           getPorts();
      //         });
      //       },
      //     )));
           ports.add(Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          '${device.productName}, ${device.manufacturerName}',
          style: GoogleFonts.robotoMono(
              fontSize: 17,
              letterSpacing: 2.0,
              color: Colors.lightGreen[700],
              fontWeight: FontWeight.w400),
        ),
        SizedBox(width: 20.0,),
        RaisedButton(
          color: Colors.blueGrey,
          onPressed: () {
            connectTo(deviceId == device.deviceId ? null : device)
                  .then((res) {
                getPorts();
              });
          },
          child: Text(deviceId == device.deviceId ? "Desconectar" : "Conectar"),
        ),
      ],
    ));
    });
  }

  void getPorts() async {
    List<UsbDevice> devices = await UsbSerial.listDevices();
    buildWidgetPorts(devices);
  }

  void acionarAnimacao() {
    controllerAnimation.forward();
  }

  Future<bool> connectTo(device) async {
    clearSerialData();

    if (subscription != null) {
      cancelSubscription();
    }

    if (transaction != null) {
      cancelTransaction();
    }

    if (port != null) {
      cancelPort();
    }

    if (device == null) {
      nullDeviceId();
      changeStatus("Disconnected");
      return true;
    }

    await createDevice(device);
    if (!await port.open()) {
      changeStatus("Failed to open port");
      return false;
    }

    setDeviceId(device);
    await setPortConfigs();

    listenSerial();

    ports.clear();
    changeStatus("Connected");
    acionarAnimacao();
    changeSegmentedOption(selectedOption);
    return true;
  }
}
