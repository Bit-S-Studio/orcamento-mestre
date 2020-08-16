import 'package:firebase_auth/firebase_auth.dart';
import 'package:orcamento_mestre/app/utils/dados_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:orcamento_mestre/app/modules/dadosEmpresa/dadosEmpresa_module.dart';
import 'package:orcamento_mestre/app/modules/login/register/dados_register.dart';
import 'package:orcamento_mestre/app/modules/login/register/pos_register.dart';
import 'package:orcamento_mestre/app/modules/login/register/register_page.dart';
import 'package:orcamento_mestre/app/utils/customHasuraConnect.dart';

class RegisterModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => FirebaseAuth.instance),
        Bind((i) => CustomHasuraConnect.getConnect(i.get<FirebaseAuth>())),
        Bind((i) => DadosController(
            CustomHasuraConnect.getConnect(i.get<FirebaseAuth>()))),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => RegisterPage()),
        Router('/', child: (_, args) => RegisterPage()),
        Router('/pos', child: (_, args) => PosRegister()),
        Router('/dados', child: (_, args) => DadosRegister()),
      ];

  static Inject get to => Inject<RegisterModule>.of();
}
