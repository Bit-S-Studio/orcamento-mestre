import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
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
      backgroundColor: Colors.blue[900],
      body: Stack(
        children: <Widget>[
          background(),
          page(),
          foto(),
        ],
      ),
    );
  }

  Widget background() {
    return Center(
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.blue[900], Colors.grey[800]])),
        child: Center(
          child: Text(''),
        ),
      ),
    );
  }

  Widget foto() {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.height;
    return Column(
      children: <Widget>[
        SizedBox(
          height: height * 0.22,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 200),
          child: Center(
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 60,
            ),
          ),
        ),
      ],
    );
  }

  Widget page() {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: height * 0.02,
        ),
        SizedBox(
          height: height * 0.08,
          child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: 0.24,
              child: IconButton(
                  icon: Icon(
                    LineAwesomeIcons.cog,
                    color: Colors.white,
                    size: height * 0.04,
                  ),
                  onPressed: () {})),
        ),
        SizedBox(
          height: height * 0.06,
        ),
        SizedBox(
          height: height * 0.1,
          child: FractionallySizedBox(
            alignment: Alignment.topLeft,
            widthFactor: 0.5,
            child: Column(
              children: [
                Text(
                  'Seja Bem-vindo!',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                  textAlign: TextAlign.left,
                ),
                Text(
                  'Mestre Lucas',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            height: height * 0.6,
            width: width,
            margin: EdgeInsets.all(24),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.grey[100]),
            child: Padding(
              padding: const EdgeInsets.all(28.0),
              child: Column(
                children: [
                  SizedBox(
                    height: height * 0.05,
                  ),
                  buttons('Solicitar orçamento', '/solicitar'),
                  buttons('Gerar orçamento', '/base'),
                  buttons('Minhas solicitações', '/solicitacoes'),
                  buttons('Meus Orçamentos', '/orcamentos'),
                  buttons('Meu perfil', '/perfil'),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget buttons(String texto, String rota) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.height;
    return Center(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 12.0, bottom: 12),
            child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                child: MaterialButton(
                  onPressed: () async {
                    Modular.to.pushNamed('/dados');
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        color: Colors.white),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            height: height * 0.06,
                            width: width * 0.08,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    bottomLeft: Radius.circular(12)),
                                gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      Colors.grey[800],
                                      Colors.blue[900]
                                    ])),
                          ),
                          Flexible(fit: FlexFit.tight, child: SizedBox()),
                          Text(
                            texto,
                            style: TextStyle(fontSize: 16),
                          ),
                          Flexible(fit: FlexFit.tight, child: SizedBox()),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Icon(LineAwesomeIcons.arrow_circle_o_right,
                                color: Colors.black),
                          )
                        ]),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
