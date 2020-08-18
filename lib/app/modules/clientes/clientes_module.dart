import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:orcamento_mestre/app/modules/clientes/clientes_page.dart';

class ClientesModule extends WidgetModule {
  @override
  List<Bind> get binds => [];

  @override
  List<Router> get routers => [
        Router('/', child: (context, args) => ClientesPage()),
        Router(Modular.initialRoute, child: (context, args) => ClientesPage())
      ];

  static Inject get to => Inject<ClientesModule>.of();

  @override
  Widget get view => ClientesPage();
}
