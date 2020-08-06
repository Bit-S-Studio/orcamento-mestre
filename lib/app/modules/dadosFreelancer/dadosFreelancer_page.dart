import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:orcamento_mestre/app/modules/dadosFreelancer/freelancer_controller.dart';
import 'package:provider/provider.dart';

import '../dadosEmpresa/formsComplemento.dart';
import '../orcamento/orcamento_controller.dart';

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
    final oController = Provider.of<OrcamentoController>(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Colors.blue[900],
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(16),
            child: Column(
              children: [
                Container(
                  height: height * .30,
                  width: width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(16))),
                  child: Center(
                    child: Text(
                      'Espaço para Admob',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                Container(
                  height: height *.65,
                  width: width,
                  margin: EdgeInsets.only(
                    top: height * .02,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.blue[900],
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16))),
                  child: Container(
                    height: height * .06,
                    width: width,
                    padding:
                    EdgeInsets.only(top: height * .02, left: width * .02),
                    child: Text(
                      'Complementos',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
                FormsComplemento(),
              ],
            ),
          ),
        ));
  }
}
