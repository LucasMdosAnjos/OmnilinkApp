
import 'package:serial_terminal/app/modules/bluetooth/bluetooth_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:serial_terminal/app/modules/bluetooth/bluetooth_page.dart';

class BluetoothModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => BluetoothController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => BluetoothPage()),
      ];

  static Inject get to => Inject<BluetoothModule>.of();
}
