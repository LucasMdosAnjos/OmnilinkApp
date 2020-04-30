import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:serial_terminal/app/modules/bluetooth/bluetooth_controller.dart';
import 'package:serial_terminal/app/modules/bluetooth/bluetooth_module.dart';

void main() {
  initModule(BluetoothModule());
  // BluetoothController bluetooth;
  //
  setUp(() {
    //     bluetooth = BluetoothModule.to.get<BluetoothController>();
  });

  group('BluetoothController Test', () {
    //   test("First Test", () {
    //     expect(bluetooth, isInstanceOf<BluetoothController>());
    //   });

    //   test("Set Value", () {
    //     expect(bluetooth.value, equals(0));
    //     bluetooth.increment();
    //     expect(bluetooth.value, equals(1));
    //   });
  });
}
