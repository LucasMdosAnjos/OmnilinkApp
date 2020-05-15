import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobx/mobx.dart';

part 'formmsgformatada_controller.g.dart';

class FormmsgformatadaController = _FormmsgformatadaControllerBase
    with _$FormmsgformatadaController;

abstract class _FormmsgformatadaControllerBase with Store {
  String titulo;
  int indiceMensagem;
  List<String> formFields;
  BluetoothCharacteristic writeCharac;
  @observable
  int value = 0;
  @observable
  var widgets = ObservableList<Widget>();
  @observable
  Map<String,String> bufferForm = Map();
  @observable
  bool enviandoForm = false;

  Map<int, String> fieldTypes = {
    0: 'alfanumerico',
    1: 'numerico',
    2: 'alfabetico',
    3: 'cnpj',
    4: 'cpf',
    5: 'dd/mm',
    6: 'dd/mm/aa',
    7: 'dd/mm/aaaa',
    8: 'hh:mm',
    9: 'moeda',
    10: 'non_editable',
    11: 'numero_real',
    12: 'renavam',
    13: 'placa_veiculo'
  };
  void sendForm(){
    if(bufferForm.toString().replaceAll('{', '').replaceAll('}', '').isNotEmpty){
    print(bufferForm.toString().replaceAll('{', '').replaceAll('}', ''));
    enviandoForm = true;
    writeCharac.write(utf8.encode('MFRMSEND,$indiceMensagem,${bufferForm.toString().replaceAll('{', '').replaceAll('}', '')}')).then((val){
      Modular.to.pop();
    });

    }else{
      Modular.to.showDialog(
        builder: (context){
          return CupertinoAlertDialog(
          title: Text(
            'Erro',
            style: GoogleFonts.sourceCodePro(
                wordSpacing: 1.5, fontWeight: FontWeight.w500, fontSize: 18.0),
          ),
          content: Text(
            'Não é possível enviar um formulário em branco.',
            style: GoogleFonts.sourceCodePro(
                wordSpacing: 1.5, fontSize: 14.0, fontWeight: FontWeight.w300),
          ),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                Modular.to.pop();
              },
              child: Text(
                'OK',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
        }
      );
    }
  }
  @action
  void buildForm() {
    formFields.forEach((element) {
      String byteFlag = byteFromString(int.parse(element.split(',')[4]));
      String fieldType =
          fieldTypes[int.parse(byteFlag.substring(2, 6), radix: 2)];
      print(fieldType);
      String fieldTitle = element.split(',')[5];
      TextInputType type;
      var controller;
      switch (fieldType) {
        case 'alfanumerico':
        controller  = TextEditingController();
        type = TextInputType.text;
          break;
        case 'numerico':
        controller = TextEditingController();
        type = TextInputType.number;
          break;
        case 'alfabetico':
        controller = TextEditingController();
        type = TextInputType.text;
          break;
        case 'cnpj':
        controller = new MaskedTextController(mask: '00.000.000/0000-00');
        type = TextInputType.number;
          break;
        case 'cpf':
        controller = new MaskedTextController(mask: '000.000.000-00');
        type = TextInputType.number;
          break;
        case 'dd/mm':
        controller = new MaskedTextController(mask: '00/00');
        type = TextInputType.number;
          break;
        case 'dd/mm/aa':
        controller = new MaskedTextController(mask: '00/00/00');
        type = TextInputType.number;
          break;
        case 'dd/mm/aaaa':
        controller = new MaskedTextController(mask: '00/00/0000');
        type = TextInputType.number;
          break;
        case 'hh:mm':
        controller = new MaskedTextController(mask: '00:00');
        type = TextInputType.number;
          break;
        case 'moeda':
        controller = TextEditingController();
        type = TextInputType.number;
          break;
        case 'non_editable':
        controller = TextEditingController();
        type = TextInputType.text;
          break;
        case 'numero_real':
        controller = TextEditingController();
        type = TextInputType.number;
          break;
        case 'renavam':
        controller = new MaskedTextController(mask: '00000000000');
        type = TextInputType.number;
          break;
        case 'placa_veiculo':
        controller = new MaskedTextController(mask: '@@@-@@@@');
        type = TextInputType.text;
          break;
      }
      widgets.add(Container(
        padding: EdgeInsets.all(12.0),
        child: TextField(
          controller: controller,
          textAlign: TextAlign.center,
          onChanged: (value) {
            print(value);
            bufferForm.addAll({
              '$fieldTitle':'$value'
            });
          },
          keyboardType: type,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6.0),
                borderSide: BorderSide(color: Colors.blue[800], width: 1.5),
              ),
              hintText: '$fieldTitle',
              hintStyle: GoogleFonts.robotoMono(
                  fontSize: 18,
                  letterSpacing: 2.0,
                  color: Colors.black,
                  fontWeight: FontWeight.w400),
              prefixIcon: Icon(
                Icons.edit,
                color: Colors.blue[800],
              )),
        ),
      ));
    });
  }

  @action
  void increment() {
    value++;
  }

  String byteFromString(int num) {
    String s = num.toRadixString(2);
    if (s.length != 8) {
      int diff = 8 - s.length;
      String temp = "";
      for (int i = 0; i < diff; i++) {
        temp += "0";
      }
      temp += s;
      s = temp;
      return s;
    }
  }
}
