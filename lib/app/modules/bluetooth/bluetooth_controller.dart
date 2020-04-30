import 'dart:async';

import 'package:flutter_blue/flutter_blue.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';

part 'bluetooth_controller.g.dart';

class BluetoothController = _BluetoothControllerBase with _$BluetoothController;

abstract class _BluetoothControllerBase with Store {
  FlutterBlue flutterBlue;
  StreamSubscription subscription;
  @observable
  int value = 0;
  @observable
  var devices = ObservableList<Widget>();
  @observable
  String text = "Conectar";


  _BluetoothControllerBase() {
    flutterBlue = FlutterBlue.instance;
    scanDevices();
  }
  void scanDevices(){
    flutterBlue.startScan(timeout: Duration(seconds: 4));
    subscription = flutterBlue.scanResults.listen((results) {
      // do something with scan results
      print(results.length);
      devices.clear();
      addWidgetsDevices(results);
    });
  }
  @action
  void addWidgetsDevices(List<ScanResult> results){
     for (ScanResult r in results) {
        print('${r.device.name} found! rssi: ${r.rssi}');
        devices.add(ListTile(
          title: Text(r.device.name),
          subtitle: Text('RSSI:${r.rssi}'),
          leading: Icon(
            Icons.bluetooth,
            color: Colors.blue,
          ),
          trailing: FlatButton(
            child: Text('$text'),
            onPressed: () async {
              if(text == "Conectar"){
              await r.device.connect();
              text = "Desconectar";
              List<BluetoothService> services =
                  await r.device.discoverServices();
              services.forEach((service) async {
                if(service.uuid.toString().toUpperCase() == "6E400001-B5A3-F393-E0A9-E50E24DCCA9E"){
                print("Serviço: " + service.uuid.toString());
                var characteristics = service.characteristics;
                for(BluetoothCharacteristic c in characteristics){
                  print(c.uuid);
                  if(c.uuid.toString().toUpperCase() == '6E400002-B5A3-F393-E0A9-E50E24DCCA9E'){
                    await c.write("A".codeUnits);
                  }
                }
                }
              });
              }else{
                await r.device.disconnect();
                text = "Conectar";
              }
            },
          ),
        ));
      }
  }

  @action
  void increment() {
    value++;
  }

  @action
  void disposeObjects() {
    subscription.cancel();
  }
}
