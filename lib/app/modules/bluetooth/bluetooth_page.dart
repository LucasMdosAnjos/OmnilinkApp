import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:serial_terminal/app/modules/bluetooth/components/cardOption/cardOption_widget.dart';
import 'bluetooth_controller.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class BluetoothPage extends StatefulWidget {
  final String title;
  const BluetoothPage({Key key, this.title = "Bluetooth"}) : super(key: key);

  @override
  _BluetoothPageState createState() => _BluetoothPageState();
}

class _BluetoothPageState
    extends ModularState<BluetoothPage, BluetoothController> {
  //use 'controller' variable to access controller

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    controller.setContext(context);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (controller.connectedDevice != "") {
          showCupertinoDialog(
              context: context,
              builder: (_) {
                return CupertinoAlertDialog(
                  title: Text(
                    'Aviso',
                    style: GoogleFonts.sourceCodePro(
                        wordSpacing: 1.5,
                        fontWeight: FontWeight.w500,
                        fontSize: 18.0),
                  ),
                  content: Text(
                    'Clique em desconectar antes de sair desta tela.',
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
                        'OK',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                );
              });
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[800],
          title: Text(
            widget.title,
            style: TextStyle(fontSize: 25.0),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              if (controller.connectedDevice != "") {
                showCupertinoDialog(
                    context: context,
                    builder: (_) {
                      return CupertinoAlertDialog(
                        title: Text(
                          'Aviso',
                          style: GoogleFonts.sourceCodePro(
                              wordSpacing: 1.5,
                              fontWeight: FontWeight.w500,
                              fontSize: 18.0),
                        ),
                        content: Text(
                          'Clique em desconectar antes de sair desta tela.',
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
                              'OK',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        ],
                      );
                    });
              } else {
                Modular.to.pop();
              }
            },
            icon: Icon(Icons.settings),
          ),
        ),
        body: Observer(builder: (_) {
          return Stack(
            children: <Widget>[
              (controller.showLoading)
                  ? Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.1),
                          backgroundBlendMode: BlendMode.darken),
                    )
                  : Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/bkg_fundo.png"),
                              fit: BoxFit.cover)),
                    ),
              (!controller.showLoading)
                  ? Column(
                      children: <Widget>[
                        SingleChildScrollView(
                          child: Column(
                            children: controller.devices.map((f) => f).toList(),
                          ),
                        ),
                        Observer(builder: (_) {
                          if (controller.connectedDevice != "") {
                            return Column(
                              children: <Widget>[
                                Container(
                                  child: Theme(
                                    data: Theme.of(context).copyWith(
                                        cardColor:
                                            Colors.white.withOpacity(0.16)),
                                    child: ExpansionPanelList(
                                      children: [
                                        ExpansionPanel(
                                            body: Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        'assets/bkg_fundo.png'),
                                                    fit: BoxFit.cover),
                                              ),
                                              // color: Color.fromRGBO(
                                              //     204, 204, 204, 1.0),
                                              child: Column(
                                                children: <Widget>[
                                                  SizedBox(
                                                    height: 12.5,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      CardOptionWidget(
                                                        option: 0,
                                                      ),
                                                      CardOptionWidget(
                                                        option: 1,
                                                      ),
                                                      CardOptionWidget(
                                                        option: 2,
                                                      ),
                                                      CardOptionWidget(
                                                        option: 3,
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      CardOptionWidget(
                                                        option: 4,
                                                      ),
                                                      CardOptionWidget(
                                                        option: 5,
                                                      ),
                                                      CardOptionWidget(
                                                        option: 6,
                                                      ),
                                                      CardOptionWidget(
                                                        option: 7,
                                                      ),
                                                    ],
                                                  ),
                                                  Align(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    child: Container(
                                                      margin: EdgeInsets.only(
                                                          right: 15.0),
                                                      width: 150.0,
                                                      height: 50.0,
                                                      child: Image.asset(
                                                        'assets/omnilink.png',
                                                        fit: BoxFit.contain,
                                                        color: Colors.blue[900],
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            headerBuilder:
                                                (BuildContext context,
                                                    bool isExpanded) {
                                              return Container(
                                                padding: EdgeInsets.all(10),
                                                alignment: Alignment.center,
                                                child: AutoSizeText(
                                                    (isExpanded ||
                                                            controller
                                                                    .selectedOption ==
                                                                15)
                                                        ? "Clique em algum botão abaixo para selecionar um tópico."
                                                        : "${controller.mapOptions[controller.selectedOption]}",
                                                    maxLines: 1,
                                                    style:
                                                        GoogleFonts.robotoMono(
                                                            fontSize: 19.5,
                                                            letterSpacing: 2.0,
                                                            color: Colors
                                                                .lightGreen,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                              );
                                            },
                                            canTapOnHeader: true,
                                            isExpanded:
                                                controller.expandPanelOptions),
                                      ],
                                      animationDuration:
                                          Duration(milliseconds: 1300),
                                      expansionCallback:
                                          (int item, bool status) {
                                        controller.setPanelExpand();
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            );
                          } else {
                            return Container();
                          }
                        }),
                        Observer(builder: (_) {
                          return Expanded(
                            child: AnimatedOpacity(
                              curve: Curves.decelerate,
                              opacity: controller.widgets.isEmpty ? 0.0 : 1.0,
                              child: SingleChildScrollView(
                                controller: controller.scroll,
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: Column(
                                    children: controller.widgets
                                        .map((widget) => widget)
                                        .toList(),
                                  ),
                                ),
                              ),
                              duration: Duration(seconds: 5),
                            ),
                          );
                        }),
                      ],
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    ),
            ],
          );
        }),
      ),
    );
  }
}
