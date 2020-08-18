import 'package:firebase_auth/firebase_auth.dart';
import 'package:orcamento_mestre/app/modules/base/base_module.dart';
import 'package:orcamento_mestre/app/modules/home/home_module.dart';
import 'package:orcamento_mestre/app/modules/login/login_page.dart';
import 'package:orcamento_mestre/app/modules/login/register/dados_register.dart';
import 'package:orcamento_mestre/app/modules/login/register/pos_register.dart';
import 'package:orcamento_mestre/app/modules/login/register/register_page.dart';
import 'package:orcamento_mestre/app/modules/login/reset/reset_page.dart';
import 'package:orcamento_mestre/app/modules/perfil/perfil_module.dart';
import 'package:orcamento_mestre/app/utils/customHasuraConnect.dart';
import 'package:orcamento_mestre/app/utils/dados_controller.dart';
import 'reset/reset_controller.dart';
import 'register/register_controller.dart';
import 'login_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => FirebaseAuth.instance),
        Bind((i) => CustomHasuraConnect.getConnect(i.get<FirebaseAuth>())),
        Bind((i) => ResetController()),
        Bind((i) => RegisterController()),
        Bind((i) => LoginController()),
        Bind((i) => DadosController(
            CustomHasuraConnect.getConnect(i.get<FirebaseAuth>()))),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => LoginPage()),
        Router('/', child: (_, args) => LoginPage()),
        Router('/register', child: (_, args) => RegisterPage()),
        Router('/reset', child: (_, args) => ResetPage()),
        Router('/pos', child: (_, args) => PosRegister()),
        Router('/dados', child: (_, args) => DadosRegister()),
        Router('/home', module: HomeModule()),
        Router('/base', module: BaseModule()),
        Router('/perfil', module: PerfilModule()),
      ];

  static Inject get to => Inject<LoginModule>.of();
}
