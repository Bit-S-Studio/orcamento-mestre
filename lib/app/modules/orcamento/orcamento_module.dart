import 'package:orcamento_mestre/app/modules/orcamento/orcamento_page.dart';

import 'orcamento_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class OrcamentoModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => OrcamentoController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => OrcamentoPage()),
        Router('/', child: (_, args) => OrcamentoPage()),
      ];

  static Inject get to => Inject<OrcamentoModule>.of();
}
