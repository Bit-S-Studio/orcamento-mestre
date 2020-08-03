import 'package:orcamento_mestre/app/modules/budget/budget_controller.dart';
import 'package:orcamento_mestre/app/modules/tipo/tipo_controller.dart';

import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:orcamento_mestre/app/app_widget.dart';
import 'package:orcamento_mestre/app/modules/home/home_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => TipoController()),
        Bind((i) => BudgetController()),
        Bind((i) => AppController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, module: HomeModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
