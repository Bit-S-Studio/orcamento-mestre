import 'package:flutter_modular/flutter_modular.dart';
import 'package:orcamento_mestre/app/modules/login/login_page.dart';
import 'package:orcamento_mestre/app/modules/perfil/perfil_controller.dart';
import 'package:orcamento_mestre/app/modules/perfil/perfil_page.dart';

class PerfilModule extends ChildModule {
  @override
  List<Bind> get binds => [Bind((i) => PerfilController())];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => PerfilPage()),
        Router('/', child: (_, args) => PerfilPage()),
        Router('/login', child: (_, args) => LoginPage()),
      ];

  static Inject get to => Inject<PerfilModule>.of();
}
