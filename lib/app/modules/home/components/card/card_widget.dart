import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

class CardWidget extends StatelessWidget {
  final String text;
  final IconData icon;
  final double size;
  const CardWidget({Key key, this.text, this.icon, this.size}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        if(text == "USB SERIAL"){
              Modular.to.pushNamed('/usb');
            }else{
              FlutterBlue flutterBlue =  FlutterBlue.instance;
              flutterBlue.isOn.then((value){
                if(value){
                  Modular.to.pushNamed('/bluetooth');
                }else{
                  showCupertinoDialog(context: context, builder: (_){
                    return CupertinoAlertDialog(
                      title: Text('Erro',style: GoogleFonts.sourceCodePro(
                        wordSpacing: 1.5,
                        fontWeight: FontWeight.w500,
                        fontSize: 18.0
                      ),),
                      content: Text('Ative o Bluetooth para navegar até a seção desejada.',
                      style: GoogleFonts.sourceCodePro(
                        wordSpacing: 1.5,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w300
                      ),),
                      actions: <Widget>[
                        FlatButton(
                          onPressed: (){   
                            Modular.to.pop();
                          }, 
                          child: Text('OK'),
                        ),
                      ],
                    );
                  });
                }
              });
            }
      },
          child: Card(
        shape: OutlineInputBorder(
           borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 5.0,
        child: Container(
          height: 225*size,
          width: 225*size,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
             gradient: LinearGradient(
                      colors: [
                        Colors.blueGrey[900],
                        Colors.blueGrey[800],
                        Colors.blueGrey,
                        Colors.blueGrey[700],
                        Colors.blueGrey[700],
                      ],
                      stops: [0.05,0.15,0.7,0.8,1.0],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight
                    ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                width: 100*size,
                height: 100*size,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(180.0),
                    border: Border.all(color: Colors.grey[800], width: 1.5)),
                child: Icon(
                  icon,
                  size: 70.0*size,
                  color: Colors.teal[200],
                ),
              ),
              Text('$text',
                  style: GoogleFonts.tinos(
                      fontSize: 25.0*size,
                      fontWeight: FontWeight.w500,
                      textStyle: TextStyle(letterSpacing: 1.5))),
            ],
          ),
        ),
      ),
    );
  }
}
