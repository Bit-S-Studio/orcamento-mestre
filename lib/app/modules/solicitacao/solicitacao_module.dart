import 'solicitacao_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';

class SolicitacaoModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => SolicitacaoController()),
      ];

  @override
  List<Router> get routers => [];

  static Inject get to => Inject<SolicitacaoModule>.of();
}
