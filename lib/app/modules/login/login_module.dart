import 'package:firebase_auth/firebase_auth.dart';
import 'package:orcamento_mestre/app/modules/login/login_page.dart';
import 'package:orcamento_mestre/app/utils/customHasuraConnect.dart';

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
        Bind((i) => RegisterController(
            CustomHasuraConnect.getConnect(i.get<FirebaseAuth>()))),
        Bind((i) => LoginController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => LoginPage()),
      ];

  static Inject get to => Inject<LoginModule>.of();
}
