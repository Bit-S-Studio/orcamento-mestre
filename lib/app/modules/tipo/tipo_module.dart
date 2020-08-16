import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:orcamento_mestre/app/modules/dadosEmpresa/dadosEmpresa_module.dart';
import 'package:orcamento_mestre/app/modules/dadosFreelancer/dadosFreelancer_module.dart';
import 'package:orcamento_mestre/app/modules/tipo/tipo_page.dart';

class TipoModule extends WidgetModule {
  @override
  List<Bind> get binds => [];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => TipoPage()),
        Router('/', child: (_, args) => TipoPage()),
        Router('/dadosEmpresa', module: DadosEmpresaModule()),
        Router('/dadosFreelancer', module: DadosFreelancerModule()),
      ];

  static Inject get to => Inject<TipoModule>.of();

  @override
  Widget get view => TipoPage();
}
