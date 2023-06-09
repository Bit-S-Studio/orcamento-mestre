import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:orcamento_mestre/app/modules/login/login_controller.dart';
import 'package:orcamento_mestre/app/modules/login/login_page.dart';
import 'package:orcamento_mestre/app/modules/login/splash/splash_page.dart';
import 'package:orcamento_mestre/app/utils/customHasuraConnect.dart';
import 'package:orcamento_mestre/app/utils/users/user_controller.dart';

class SplashModule extends ChildModule {
  @override
  List<Bind> get binds =>
      [Bind((i) => UserController()), Bind((i) => LoginController())];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => SplashPage()),
        Router('/login', child: (_, args) => LoginPage()),
      ];

  static Inject get to => Inject<SplashModule>.of();
}
