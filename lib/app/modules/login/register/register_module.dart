import 'package:flutter_modular/flutter_modular.dart';
import 'package:orcamento_mestre/app/modules/dadosEmpresa/dadosEmpresa_module.dart';
import 'package:orcamento_mestre/app/modules/login/register/dados_register.dart';
import 'package:orcamento_mestre/app/modules/login/register/pos_register.dart';
import 'package:orcamento_mestre/app/modules/login/register/register_page.dart';

class RegisterModule extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => RegisterPage()),
        Router('/', child: (_, args) => RegisterPage()),
        Router('/pos', child: (_, args) => PosRegister()),
        Router('/dados', child: (_, args) => DadosRegister()),
      ];

  static Inject get to => Inject<RegisterModule>.of();
}
