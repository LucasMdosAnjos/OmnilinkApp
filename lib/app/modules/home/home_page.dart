import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'components/card/card_widget.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Bem-vindo!"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController>
    with TickerProviderStateMixin {
  //use 'controller' variable to access controller

  @override
  void initState() {
    super.initState();
    controller.controllerAnimation = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1250));
    controller.controllerCard = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1500));
    controller.controllerAnimation.forward();
    controller.controllerCard.forward();
    controller.getPermissions();
  }

  @override
  void dispose() {
    super.dispose();
    controller.controllerAnimation.dispose();
    controller.controllerCard.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.cardSize = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: controller.controllerCard, curve: Curves.easeOut));
    controller.opacity = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: controller.controllerAnimation, curve: Curves.easeIn));
    return AnimatedBuilder(
        animation: controller.controllerAnimation,
        builder: (context, _) {
          return Opacity(
            opacity: controller.opacity.value,
            child: Scaffold(
              body: SafeArea(
                child: Stack(
                  children: <Widget>[
                    Container(
                      decoration: new BoxDecoration(
                          image: new DecorationImage(
                              image: new AssetImage("assets/bkg_fundo.png"),
                              fit: BoxFit.fill)),
                    ),
                    SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.04),
                          Image.asset(
                            'assets/omnilink.png',
                            width: 225,
                            height: 112.5,
                            color: Colors.blue[400],
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.04),
                          Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(color: Colors.blueGrey, borderRadius: BorderRadius.circular(15.0),),
                            child: Text(
                              'Selecione o tipo de conexão:',
                              style: GoogleFonts.robotoMono(
                                  fontSize: 22.5,
                                  letterSpacing: 2.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.15),
                          AnimatedBuilder(
                              animation: controller.controllerCard,
                              builder: (context, _) {
                                return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    CardWidget(
                                      text: 'USB SERIAL',
                                      icon: Icons.usb,
                                      size: controller.cardSize.value,
                                    ),
                                    CardWidget(
                                      text: 'BLUETOOTH',
                                      icon: Icons.bluetooth,
                                      size: controller.cardSize.value,
                                    ),
                                  ],
                                );
                              }),
                          //SizedBox(height: MediaQuery.of(context).size.height * 0.07),
                          //ClockWidget(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
