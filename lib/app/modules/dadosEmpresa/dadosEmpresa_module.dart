import 'empresa_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';

class DadosEmpresaModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => EmpresaController()),
      ];

  @override
  List<Router> get routers => [];

  static Inject get to => Inject<DadosEmpresaModule>.of();
}
