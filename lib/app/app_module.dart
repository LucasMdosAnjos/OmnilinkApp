import 'package:serial_terminal/app/app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:serial_terminal/app/app_widget.dart';
import 'package:serial_terminal/app/modules/bluetooth/bluetooth_module.dart';
import 'package:serial_terminal/app/modules/home/home_module.dart';
import 'package:serial_terminal/app/modules/usb/usb_module.dart';

import 'modules/formmsgformatada/formmsgformatada_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, module: HomeModule()),
        Router('/usb',module: UsbModule(),transition: TransitionType.fadeIn),
        Router('/bluetooth',module: BluetoothModule(),transition: TransitionType.fadeIn),
        Router('/formMsgFormatada',module: FormmsgformatadaModule(),transition: TransitionType.fadeIn)
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
