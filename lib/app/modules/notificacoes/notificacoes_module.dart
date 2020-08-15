import 'notificacoes_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';

class NotificacoesModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => NotificacoesController()),
      ];

  @override
  List<Router> get routers => [];

  static Inject get to => Inject<NotificacoesModule>.of();
}
