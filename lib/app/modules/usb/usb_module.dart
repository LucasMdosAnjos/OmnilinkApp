
import 'package:serial_terminal/app/modules/usb/usb_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:serial_terminal/app/modules/usb/usb_page.dart';

class UsbModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => UsbController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => UsbPage()),
      ];

  static Inject get to => Inject<UsbModule>.of();
}
