import 'orcamento_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';

class OrcamentoModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => OrcamentoController()),
      ];

  @override
  List<Router> get routers => [];

  static Inject get to => Inject<OrcamentoModule>.of();
}
