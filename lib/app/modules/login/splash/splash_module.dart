import 'package:flutter_modular/flutter_modular.dart';
import 'package:orcamento_mestre/app/modules/login/splash/splash_page.dart';
import 'package:orcamento_mestre/app/utils/user_controller.dart';

class SplashModule extends ChildModule {
  @override
  List<Bind> get binds => [Bind((i) => UserController())];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => SplashPage()),
      ];

  static Inject get to => Inject<SplashModule>.of();
}
