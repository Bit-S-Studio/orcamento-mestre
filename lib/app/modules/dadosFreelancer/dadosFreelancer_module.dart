import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:orcamento_mestre/app/modules/dadosEmpresa/empresa_controller.dart';
import 'package:orcamento_mestre/app/modules/dadosFreelancer/dadosFreelancer_page.dart';
import 'package:orcamento_mestre/app/modules/dadosFreelancer/freelancer_controller.dart';

class DadosFreelancerModule extends WidgetModule {
  @override
  List<Bind> get binds => [
        Bind((i) => FreelancerController()),
        Bind((i) => EmpresaController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => DadosFreelancerPage()),
        Router('/', child: (_, args) => DadosFreelancerPage()),
      ];

  static Inject get to => Inject<DadosFreelancerModule>.of();

  @override
  Widget get view => DadosFreelancerPage();
}
