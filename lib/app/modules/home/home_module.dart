import 'package:flutter/material.dart';
import 'package:orcamento_mestre/app/modules/base/base_module.dart';
import 'package:orcamento_mestre/app/modules/perfil/perfil_module.dart';
import 'package:orcamento_mestre/app/utils/users/user_controller.dart';

import 'home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_page.dart';

class HomeModule extends WidgetModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController()),
        Bind((i) => UserController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => HomePage()),
        Router('/solicitar', module: BaseModule()),
        Router('/base', module: BaseModule()),
        Router('/solicitacoes', module: BaseModule()),
        Router('/orcamentos', module: BaseModule()),
        Router('/perfil', module: PerfilModule()),
      ];

  static Inject get to => Inject<HomeModule>.of();

  @override
  Widget get view => HomePage();
}
