import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:serial_terminal/app/modules/bluetooth/bluetooth_controller.dart';
import 'package:serial_terminal/app/modules/bluetooth/components/cardOption/cardOption_widget.dart';

class DashboardPage extends StatefulWidget {
  final String title;
  const DashboardPage({Key key, this.title = "Dashboard"}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  var controller = Modular.get<BluetoothController>();
  @override
  void initState() {
    super.initState();
    print(controller.selectedOption);
    print(Modular.link.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
            ImageIcon(
              AssetImage('assets/omnilink_logo.png'),
              size: 110,
            ),
          ],
        backgroundColor: Colors.red,
        title: Text(
          widget.title,
          style: TextStyle(fontSize: 25.0),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/bkg_fundo.png"),
                    fit: BoxFit.cover)),
          ),
          SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: <Widget>[
                  Observer(builder: (_) {
                            return Column(
                              children:
                                  controller.devices.map((f) => f).toList(),
                            );}),
                  SizedBox(
                    height: 12.5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                    mainAxisAlignment: MainAxisAlignment.center,
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
