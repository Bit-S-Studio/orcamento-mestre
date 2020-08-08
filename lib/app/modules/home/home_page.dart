import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:orcamento_mestre/app/modules/dadosEmpresa/dadosEmpresa_page.dart';
import 'package:orcamento_mestre/app/modules/dadosFreelancer/dadosFreelancer_page.dart';
import 'package:orcamento_mestre/app/modules/orcamento/orcamento_controller.dart';
import 'package:provider/provider.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = ""}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: page(),
    );
  }

  Widget page() {
    final oController = Provider.of<OrcamentoController>(context);
    return (oController.tipo2 == "Empresa")
        ? DadosEmpresaPage()
        : DadosFreelancerPage();
  }
}
