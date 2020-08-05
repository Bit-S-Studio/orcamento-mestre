import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:orcamento_mestre/app/modules/dadosFreelancer/freelancer_controller.dart';

class DadosFreelancerPage extends StatefulWidget {
  final String title;
  const DadosFreelancerPage({Key key, this.title = "DadosFreelancer"})
      : super(key: key);

  @override
  _DadosFreelancerPageState createState() => _DadosFreelancerPageState();
}

class _DadosFreelancerPageState
    extends ModularState<DadosFreelancerPage, FreelancerController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
