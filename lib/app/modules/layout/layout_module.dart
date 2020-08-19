import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:orcamento_mestre/app/modules/layout/layout_controller.dart';
import 'package:orcamento_mestre/app/modules/layout/layout_page.dart';

class LayoutModule extends WidgetModule {
  @override
  List<Bind> get binds => [
        Bind((i) => LayoutController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => LayoutPage()),
        Router('/', child: (_, args) => LayoutPage()),
      ];

  static Inject get to => Inject<LayoutModule>.of();

  @override
  Widget get view => LayoutPage();
}
