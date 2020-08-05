import 'package:flutter_modular/flutter_modular.dart';
import 'package:orcamento_mestre/app/modules/dadosEmpresa/dadosEmpresa_module.dart';
import 'package:orcamento_mestre/app/modules/dadosFreelancer/dadosFreelancer_module.dart';
import 'package:orcamento_mestre/app/modules/tipo/tipo_controller.dart';
import 'package:orcamento_mestre/app/modules/tipo/tipo_page.dart';

class TipoModule extends ChildModule {
  @override
  List<Bind> get binds => [Bind((i) => TipoController())];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => TipoPage()),
        Router('/', child: (_, args) => TipoPage()),
        Router('/dadosEmpresa', module: DadosEmpresaModule()),
        Router('/dadosFreelancer', module: DadosFreelancerModule()),
      ];

  static Inject get to => Inject<TipoModule>.of();
}
