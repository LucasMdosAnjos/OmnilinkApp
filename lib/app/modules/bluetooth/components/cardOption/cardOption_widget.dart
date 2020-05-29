
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:serial_terminal/app/modules/bluetooth/bluetooth_controller.dart';


class CardOptionWidget extends StatelessWidget {
  final int option;
  const CardOptionWidget({Key key, this.option}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var controller = Modular.get<BluetoothController>();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Observer(builder: (_) {
        return Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: InkWell(
                highlightColor: Colors.yellow.withOpacity(0.2),
                borderRadius: BorderRadius.circular(25.0),
                onTap: () {
                  controller.changeSegmentedOption(option);
                  controller.setOption(option);
                  Modular.to.pop();
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    (option == controller.selectedOption)
                        ? Image.asset(
                            'assets/bt_down.png',
                          )
                        : Container(),
                    Container(
                      width: 115,
                      height: 115,
                      alignment: Alignment.center,
                      child: Image.asset(
                        controller.mapPictures[option],
                        fit: BoxFit.contain,
                      ),
                    )
                  ],
                )));
      }),
    );
  }
}
