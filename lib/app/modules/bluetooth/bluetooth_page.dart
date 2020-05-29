import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
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
          await controller.disconnectDevice();
          return true;
        } else {
          return true;
        }
      },
      child: Scaffold(
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      'Menu de opções',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.robotoMono(
                          fontSize: 19.5,
                          letterSpacing: 1.5,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                    Container(
                      width: 150,
                      height: 50,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/omnilink_logo.png'),
                              fit: BoxFit.contain)),
                    ),
                  ],
                ),
                decoration:
                    BoxDecoration(color: Colors.blueGrey.withOpacity(0.6)),
              ),
              Card(
                elevation: 5.0,
                child: ListTile(
                  leading: Icon(
                    Icons.settings,
                    color: Colors.blue[800],
                  ),
                  title: Text('Configurar',
                      style: GoogleFonts.robotoMono(
                          fontSize: 14.0,
                          letterSpacing: 1.5,
                          color: Colors.black,
                          fontWeight: FontWeight.w500)),
                  onTap: () async {
                    if (controller.connectedDevice != "") {
                      await controller.disconnectDevice();
                      Modular.to.pop();
                      Modular.to.pop();
                    } else {
                      Modular.to.pop();
                      Modular.to.pop();
                    }
                  },
                ),
              ),
              Card(
                elevation: 5.0,
                child: ListTile(
                  leading: Icon(
                    Icons.dashboard,
                    color: Colors.blue[800],
                  ),
                  title: Text('Dashboard',
                      style: GoogleFonts.robotoMono(
                          fontSize: 14.0,
                          letterSpacing: 1.5,
                          color: Colors.black,
                          fontWeight: FontWeight.w500)),
                  onTap: () {
                    if (controller.connectedDevice != "") {
                      Modular.to.pop();
                      Modular.to.pushNamed('/bluetooth/dashboard');
                    } else {
                      Modular.to.showDialog(builder: (_) {
                        return CupertinoAlertDialog(
                          title: Text(
                            'Aviso',
                            style: GoogleFonts.sourceCodePro(
                                wordSpacing: 1.5,
                                fontWeight: FontWeight.w500,
                                fontSize: 18.0),
                          ),
                          content: Text(
                            'Conecte em um dispositivo antes de acessar o dashboard.',
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
                    }
                  },
                ),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.blue[800],
          title: Text(
            widget.title,
            style: TextStyle(fontSize: 25.0),
          ),
          centerTitle: true,
          actions: <Widget>[
            ImageIcon(
              AssetImage('assets/omnilink_logo.png'),
              size: 110,
            ),
          ],
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
                          child: Observer(builder: (_) {
                            return (controller.connectedDevice == "")
                                ? Column(
                                    children: controller.devices
                                        .map((f) => f)
                                        .toList(),
                                  )
                                : Container();
                          }),
                        ),
                        Observer(builder: (_) {
                          return (controller.connectedDevice != "" &&
                                  controller.selectedOption == 15)
                              ? Expanded(
                                  child: Center(
                                    child: Text(
                                      'Acesse o Dashboard no menu lateral para escolher um tópico.',
                                      style: GoogleFonts.robotoMono(
                                          fontSize: 17,
                                          letterSpacing: 2.0,
                                          color: Colors.lightGreen[700],
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                )
                              : Container();
                        }),
                        // Observer(builder: (_) {
                        //   if (controller.connectedDevice != "") {
                        //     return Column(
                        //       children: <Widget>[
                        //         Container(
                        //           child: Theme(
                        //             data: Theme.of(context).copyWith(
                        //                 cardColor:
                        //                     Colors.white.withOpacity(0.16)),
                        //             child: ExpansionPanelList(
                        //               children: [
                        //                 ExpansionPanel(
                        //                     body: Container(
                        //                       width: MediaQuery.of(context)
                        //                           .size
                        //                           .width,
                        //                       decoration: BoxDecoration(
                        //                         image: DecorationImage(
                        //                             image: AssetImage(
                        //                                 'assets/bkg_fundo.png'),
                        //                             fit: BoxFit.cover),
                        //                       ),
                        //                       child: Column(
                        //                         children: <Widget>[
                        //                           SizedBox(
                        //                             height: 12.5,
                        //                           ),
                        //                           Row(
                        //                             mainAxisAlignment:
                        //                                 MainAxisAlignment
                        //                                     .center,
                        //                             children: <Widget>[
                        //                               CardOptionWidget(
                        //                                 option: 0,
                        //                               ),
                        //                               CardOptionWidget(
                        //                                 option: 1,
                        //                               ),
                        //                               CardOptionWidget(
                        //                                 option: 2,
                        //                               ),
                        //                               CardOptionWidget(
                        //                                 option: 3,
                        //                               ),
                        //                             ],
                        //                           ),
                        //                           Row(
                        //                             mainAxisAlignment:
                        //                                 MainAxisAlignment
                        //                                     .center,
                        //                             children: <Widget>[
                        //                               CardOptionWidget(
                        //                                 option: 4,
                        //                               ),
                        //                               CardOptionWidget(
                        //                                 option: 5,
                        //                               ),
                        //                               CardOptionWidget(
                        //                                 option: 6,
                        //                               ),
                        //                               CardOptionWidget(
                        //                                 option: 7,
                        //                               ),
                        //                             ],
                        //                           ),
                        //                         ],
                        //                       ),
                        //                     ),
                        //                     headerBuilder:
                        //                         (BuildContext context,
                        //                             bool isExpanded) {
                        //                       return Container(
                        //                         padding: EdgeInsets.all(10),
                        //                         alignment: Alignment.center,
                        //                         child: AutoSizeText(
                        //                             (isExpanded ||
                        //                                     controller
                        //                                             .selectedOption ==
                        //                                         15)
                        //                                 ? "Selecione um tópico acessando o Dashboard no menu lateral."
                        //                                 : "${controller.mapOptions[controller.selectedOption]}",
                        //                             maxLines: 1,
                        //                             style:
                        //                                 GoogleFonts.robotoMono(
                        //                                     fontSize: 19.5,
                        //                                     letterSpacing: 2.0,
                        //                                     color: Colors
                        //                                         .lightGreen,
                        //                                     fontWeight:
                        //                                         FontWeight
                        //                                             .bold)),
                        //                       );
                        //                     },
                        //                     canTapOnHeader: true,
                        //                     isExpanded:
                        //                         controller.expandPanelOptions),
                        //               ],
                        //               animationDuration:
                        //                   Duration(milliseconds: 1300),
                        //               expansionCallback:
                        //                   (int item, bool status) {
                        //                 controller.setPanelExpand();
                        //               },
                        //             ),
                        //           ),
                        //         ),
                        //       ],
                        //     );
                        //   } else {
                        //     return Container();
                        //   }
                        // }),
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
