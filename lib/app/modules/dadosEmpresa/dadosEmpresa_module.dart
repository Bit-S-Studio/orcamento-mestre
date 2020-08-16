import 'package:orcamento_mestre/app/modules/dadosEmpresa/dadosEmpresa_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DadosEmpresaModule extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => DadosEmpresaPage()),
        Router('/', child: (_, args) => DadosEmpresaPage()),
      ];

  static Inject get to => Inject<DadosEmpresaModule>.of();
}
