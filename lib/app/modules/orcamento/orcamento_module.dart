import 'package:flutter/material.dart';
import 'package:orcamento_mestre/app/modules/orcamento/orcamento_page.dart';
import 'package:orcamento_mestre/app/modules/pdf/pdf_module.dart';
import 'orcamento_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class OrcamentoModule extends WidgetModule {
  @override
  List<Bind> get binds => [
        Bind((i) => OrcamentoController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => OrcamentoPage()),
        Router('/', child: (_, args) => OrcamentoPage()),
        Router('/pdf', module: PdfModule())
      ];

  static Inject get to => Inject<OrcamentoModule>.of();

  @override
  Widget get view => OrcamentoPage();
}
