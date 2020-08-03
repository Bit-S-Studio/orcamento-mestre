import 'package:flutter_modular/flutter_modular.dart';
import 'package:orcamento_mestre/app/modules/tipo/tipo_controller.dart';
import 'package:orcamento_mestre/app/modules/tipo/tipo_page.dart';

class TipoModule extends ChildModule {
  @override
  List<Bind> get binds => [Bind((i) => TipoController())];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => TipoPage()),
        Router('/', child: (_, args) => TipoPage()),
        Router('/dadosEmpresa', child: (_, args) => TipoPage()),
      ];

  static Inject get to => Inject<TipoModule>.of();
}
