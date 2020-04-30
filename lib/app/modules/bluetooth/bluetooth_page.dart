import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
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
  void dispose() {
    super.dispose();
    controller.disposeObjects();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Observer(builder: (_) {
        return Column(
          children: controller.devices.map((f) => f).toList(),
        );
      }),
    );
  }
}
