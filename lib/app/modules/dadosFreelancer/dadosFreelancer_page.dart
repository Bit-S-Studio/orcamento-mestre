import 'package:flutter/material.dart';
import 'package:orcamento_mestre/app/modules/dadosFreelancer/formsComplemento.dart';
import 'package:orcamento_mestre/app/utils/dados_controller.dart';
import 'package:provider/provider.dart';

class DadosFreelancerPage extends StatefulWidget {
  final String title;

  const DadosFreelancerPage({Key key, this.title = "DadosFreelancer"})
      : super(key: key);

  @override
  _DadosFreelancerPageState createState() => _DadosFreelancerPageState();
}

class _DadosFreelancerPageState extends State<DadosFreelancerPage> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<DadosController>(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Container(
            margin: EdgeInsets.only(top: height *.001,),
            child: FormsComplemento(),
          ),
        ));
  }
}
