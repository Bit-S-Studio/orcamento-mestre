import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:orcamento_mestre/app/modules/dadosFreelancer/formsComplemento.dart';
import 'package:orcamento_mestre/app/utils/dados_controller.dart';
import 'package:provider/provider.dart';
import '../orcamento/orcamento_controller.dart';

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
            margin: EdgeInsets.only(top: 16, left: 16, right: 16),
            child: Column(
              children: [
                Container(
                  height: height * .68,
                  width: width,
                  margin: EdgeInsets.only(
                    top: height * .02,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.blue[900],
                      borderRadius: BorderRadius.all(Radius.circular(16))),
                  child: Column(
                    children: [
                      SizedBox(height: 16),
                      Text(
                        'Dados',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      SizedBox(height: 16),
                      FormsComplemento(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
