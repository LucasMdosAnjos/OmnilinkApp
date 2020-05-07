
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:usb_serial/usb_serial.dart';
import 'clock/clock_widget.dart';
import 'components/cardOption/cardOption_widget.dart';
import 'usb_controller.dart';

class UsbPage extends StatefulWidget {
  final String title;
  const UsbPage({Key key, this.title = "USB SERIAL"}) : super(key: key);

  @override
  _UsbPageState createState() => _UsbPageState();
}

class _UsbPageState extends ModularState<UsbPage, UsbController>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  //use 'controller' variable to access controller

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    UsbSerial.usbEventStream.listen((UsbEvent event) {
      controller.getPorts();
    });
    controller.getPorts();
    controller.controllerAnimation =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
    controller.connectTo(null);
    controller.controllerAnimation.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      print('resumed');
    } else if (state == AppLifecycleState.inactive) {
      print('inactive');
      //controller.setClock(true);
    } else if (state == AppLifecycleState.paused) {
      print('paused');
      //controller.setClock(true);
    } else if (state == AppLifecycleState.detached) {
      print('detached');
      //controller.setClock(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    controller.offset = Tween<double>(
            begin: -MediaQuery.of(context).size.height * 0.6, end: 0.0)
        .animate(CurvedAnimation(
            parent: controller.controllerAnimation, curve: Curves.decelerate));
    return WillPopScope(
      onWillPop: () async {
        if (controller.showClock) {
          controller.setClock(false);
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          backgroundColor: Colors.blue[800],
          centerTitle: true,
          title: Text(
            widget.title,
            style: TextStyle(fontSize: 25.0),
          ),
          leading: IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Modular.to.pop();
            },
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.store),
              onPressed: () {
                controller.ports.clear();
                controller.changeStatus("Connected");
                controller.acionarAnimacao();
              },
            ),
            IconButton(
              icon: Icon(Icons.usb),
              onPressed: () {
                // controller.serialData.add('MFRMINIT,1,0');
                // controller.serialData
                //     .add('MFRM,Mensagem de teste para o motorista0');
                controller.addPort();
                controller.addSerial("MFRMINIT,0,0");
                controller.addSerial("MFRMINIT,1,0");
                controller.addSerial(
                    "MFRM, Atenção motorista a carga é valiosa reduza a sua velocidade.");
                controller.addSerial("MFRMCF");
                controller.addSerial("MRPREV,1");
                controller.addSerial("MRPREV,0");
              },
            ),
            IconButton(
              icon: Icon(Icons.access_time),
              onPressed: () {
                controller.setClock(!controller.showClock);
              },
            ),
          ],
        ),
        body: Stack(
          children: <Widget>[
            Observer(builder: (_) {
              return Container(
                decoration: BoxDecoration(
                    image: (controller.expandPanelOptions &&
                            controller.status == 'Connected')
                        ? DecorationImage(
                            colorFilter: ColorFilter.mode(
                                Colors.black.withOpacity(0.6),
                                BlendMode.darken),
                            image: AssetImage("assets/bkg_fundo.png"),
                            fit: BoxFit.cover)
                        : DecorationImage(
                            image: AssetImage("assets/bkg_fundo.png"),
                            fit: BoxFit.cover)),
              );
            }),
            Center(child: Observer(builder: (_) {
              return (controller.showClock)
                  ? ClockWidget()
                  : (controller.status != 'Connected')
                      ? Column(children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.45,
                            child: Center(
                              child: Container(
                                width: 200.0,
                                height: 150.0,
                                child: Image.asset(
                                  'assets/omnilink.png',
                                  fit: BoxFit.contain,
                                  color: Colors.blue[900],
                                ),
                              ),
                            ),
                          ),
                          Observer(builder: (_) {
                            return Text(
                              controller.ports.length > 0
                                  ? "Available Serial Ports"
                                  : "No serial devices available",
                              style: GoogleFonts.robotoMono(
                                  fontSize: 22.5,
                                  letterSpacing: 2.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400),
                            );
                          }),
                          Observer(builder: (_) {
                            return Column(
                              children: controller.ports
                                  .map((widget) => widget)
                                  .toList(),
                            );
                          }),
                          Observer(builder: (_) {
                            return Text(
                              'Status: ${controller.status}\n',
                              style: GoogleFonts.robotoMono(
                                  fontSize: 15.5,
                                  letterSpacing: 2.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400),
                            );
                          }),
                        ])
                      : Column(
                          children: <Widget>[
                            Observer(builder: (_) {
                              return Column(
                                children: controller.ports
                                    .map((widget) => widget)
                                    .toList(),
                              );
                            }),
                            AnimatedBuilder(
                                animation: controller.controllerAnimation,
                                builder: (context, _) {
                                  return Transform.translate(
                                    offset: Offset(0, controller.offset.value),
                                    child: Observer(builder: (_) {
                                      return Container(
                                        child: Theme(
                                          data: Theme.of(context).copyWith(
                                              cardColor: Colors.white
                                                  .withOpacity(0.16)),
                                          child: ExpansionPanelList(
                                            children: [
                                              ExpansionPanel(
                                                  body: Container(
                                                    width:
                                                        MediaQuery.of(context)
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
                                                          height: 25.0,
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
                                                          alignment: Alignment
                                                              .centerRight,
                                                          child: Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    right:
                                                                        15.0),
                                                            width: 180.0,
                                                            height: 80.0,
                                                            child: Image.asset(
                                                              'assets/omnilink.png',
                                                              fit: BoxFit
                                                                  .contain,
                                                              color: Colors
                                                                  .blue[900],
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
                                                      padding:
                                                          EdgeInsets.all(10),
                                                      alignment:
                                                          Alignment.center,
                                                      child: AutoSizeText(
                                                          (isExpanded ||
                                                                  controller
                                                                          .selectedOption ==
                                                                      15)
                                                              ? "Clique em algum botão abaixo para selecionar um tópico."
                                                              : "${controller.mapOptions[controller.selectedOption]}",
                                                          maxLines: 1,
                                                          style: GoogleFonts
                                                              .robotoMono(
                                                                  fontSize:
                                                                      19.5,
                                                                  letterSpacing:
                                                                      2.0,
                                                                  color: Colors
                                                                      .lightGreen,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                    );
                                                  },
                                                  canTapOnHeader: true,
                                                  isExpanded: controller
                                                      .expandPanelOptions),
                                            ],
                                            animationDuration:
                                                Duration(milliseconds: 1300),
                                            expansionCallback:
                                                (int item, bool status) {
                                              controller.setPanelExpand();
                                            },
                                          ),
                                        ),
                                      );
                                    }),
                                  );
                                }),
                            SizedBox(
                              height: 30.0,
                            ),
                            Observer(builder: (_) {
                              return (controller.selectedOption != 15 &&
                                      controller.widgets.isEmpty)
                                  ? Text(
                                      'Ainda não há respostas para este tópico.',
                                      style: GoogleFonts.robotoMono(
                                          fontSize: 22.5,
                                          letterSpacing: 2.0,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    )
                                  : Container();
                            }),
                            Observer(builder: (_) {
                              return Expanded(
                                child: AnimatedOpacity(
                                  curve: Curves.decelerate,
                                  opacity:
                                      controller.widgets.isEmpty ? 0.0 : 1.0,
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
                        );
            })),
          ],
        ),
      ),
    );
  }
}
