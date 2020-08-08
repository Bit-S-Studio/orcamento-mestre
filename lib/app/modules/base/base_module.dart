import 'package:flutter_modular/flutter_modular.dart';
import 'package:orcamento_mestre/app/modules/base/base_controller.dart';
import 'package:orcamento_mestre/app/modules/base/base_page.dart';

class BaseModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => BaseController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => BasePage()),
      ];

  static Inject get to => Inject<BaseModule>.of();
}
