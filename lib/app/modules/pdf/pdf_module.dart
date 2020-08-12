import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';

class PdfModule extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<Router> get routers => [];

  static Inject get to => Inject<PdfModule>.of();
}
