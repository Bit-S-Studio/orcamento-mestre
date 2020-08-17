import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';

class PerfilModule extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<Router> get routers => [];

  static Inject get to => Inject<PerfilModule>.of();
}