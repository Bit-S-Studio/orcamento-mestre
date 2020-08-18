import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:orcamento_mestre/app/modules/base/base_controller.dart';
import 'package:orcamento_mestre/app/modules/base/base_page.dart';
import 'package:orcamento_mestre/app/modules/clientes/clientes_controller.dart';
import 'package:orcamento_mestre/app/utils/customHasuraConnect.dart';

class BaseModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => FirebaseAuth.instance),
        Bind((i) => CustomHasuraConnect.getConnect(i.get<FirebaseAuth>())),
        Bind((i) => BaseController()),
        Bind((i) => ClientesController(
            CustomHasuraConnect.getConnect(i.get<FirebaseAuth>()))),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => BasePage()),
      ];

  static Inject get to => Inject<BaseModule>.of();
}
