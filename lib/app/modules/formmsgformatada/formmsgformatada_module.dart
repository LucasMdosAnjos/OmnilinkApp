import 'package:serial_terminal/app/modules/formmsgformatada/formmsgformatada_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:serial_terminal/app/modules/formmsgformatada/formmsgformatada_page.dart';

class FormmsgformatadaModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => FormmsgformatadaController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute,
            child: (_, args) => FormmsgformatadaPage(
                  titulo: args.data['titulo'],
                  formFields: args.data['formFields'],
                  writeCharac: args.data['writeCharac'], indiceMensagem: args.data['indiceMensagem'],
                )),
      ];

  static Inject get to => Inject<FormmsgformatadaModule>.of();
}
