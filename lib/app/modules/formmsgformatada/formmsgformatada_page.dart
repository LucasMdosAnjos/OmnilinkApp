import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'formmsgformatada_controller.dart';

class FormmsgformatadaPage extends StatefulWidget {
  final BluetoothCharacteristic writeCharac;
  final String titulo;
  final List<String> formFields;
  final int indiceMensagem;
  const FormmsgformatadaPage(
      {Key key,
      @required this.writeCharac,
      this.titulo,
      @required this.formFields,
      @required this.indiceMensagem})
      : super(key: key);

  @override
  _FormmsgformatadaPageState createState() => _FormmsgformatadaPageState();
}

class _FormmsgformatadaPageState
    extends ModularState<FormmsgformatadaPage, FormmsgformatadaController> {
  //use 'controller' variable to access controller

  @override
  void initState() {
    super.initState();
    print('salve');
    controller.titulo = widget.titulo;
    controller.formFields = widget.formFields;
    controller.writeCharac = widget.writeCharac;
    controller.indiceMensagem = widget.indiceMensagem;
    controller.buildForm();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Formulário',
          style: TextStyle(fontSize: 25),
        ),
        backgroundColor: Colors.blue[800],
        centerTitle: true,
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              controller.sendForm();
            },
            child: Text(
              'ENVIAR',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      body: Observer(builder: (_) {
        return (!controller.enviandoForm) ? Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/bkg_fundo.png'),
                      fit: BoxFit.cover)),
            ),
            Observer(builder: (_) {
              return SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      '${controller.titulo}',
                      style: GoogleFonts.sourceCodePro(
                          wordSpacing: 1.5,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 18.0),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Container(
                      padding: EdgeInsets.all(15.0),
                      width: MediaQuery.of(context).size.width * 0.6,
                      decoration: BoxDecoration(color: Colors.white54),
                      child: Column(
                        children: controller.widgets,
                      ),
                    ),
                  ],
                ),
              );
            })
          ],
        ) : Center(
          child: CircularProgressIndicator(),
        );
      }),
    );
  }
}
