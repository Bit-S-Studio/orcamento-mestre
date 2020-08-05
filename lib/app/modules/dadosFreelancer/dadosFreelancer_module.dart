import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';
import 'package:orcamento_mestre/app/modules/dadosFreelancer/dadosFreelancer_page.dart';
import 'package:orcamento_mestre/app/modules/dadosFreelancer/freelancer_controller.dart';

class DadosFreelancerModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => FreelancerController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => DadosFreelancerPage()),
        Router('/', child: (_, args) => DadosFreelancerPage()),
      ];

  static Inject get to => Inject<DadosFreelancerModule>.of();
}
