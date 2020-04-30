import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:serial_terminal/app/modules/usb/usb_controller.dart';
import 'package:serial_terminal/app/modules/usb/usb_module.dart';

void main() {
  initModule(UsbModule());
  // UsbController usb;
  //
  setUp(() {
    //     usb = UsbModule.to.get<UsbController>();
  });

  group('UsbController Test', () {
    //   test("First Test", () {
    //     expect(usb, isInstanceOf<UsbController>());
    //   });

    //   test("Set Value", () {
    //     expect(usb.value, equals(0));
    //     usb.increment();
    //     expect(usb.value, equals(1));
    //   });
  });
}
