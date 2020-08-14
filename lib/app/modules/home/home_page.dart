import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:orcamento_mestre/app/utils/users/user_controller.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = ""}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    final controller = Provider.of<UserController>(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.height;
    return Column(
      children: <Widget>[
        SizedBox(
          height: height * 0.23,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 200),
          child: Center(
            child: StreamBuilder<Object>(
                stream: null,
                builder: (context, snapshot) {
                  return CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 60,
                    child: CircleAvatar(
                      backgroundImage:
                          NetworkImage(controller.imagem.toString()),
                      radius: 56,
                    ),
                  );
                }),
          ),
        ),
      ],
    );
  }

  Widget page() {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.height;
    final controller = Provider.of<UserController>(context);
    var teste = controller.setUser();
    print(teste);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: height * 0.14,
        ),
        SizedBox(
          height: height * 0.02,
          child: FractionallySizedBox(
            widthFactor: 1,
            alignment: Alignment.topRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    icon: Icon(
                      LineAwesomeIcons.bell_o,
                      color: Colors.white,
                    ),
                    onPressed: () {}),
                IconButton(
                    icon: Icon(
                      LineAwesomeIcons.comments_o,
                      color: Colors.white,
                    ),
                    onPressed: () {}),
                IconButton(
                    icon: Icon(
                      LineAwesomeIcons.cog,
                      color: Colors.white,
                    ),
                    onPressed: () {}),
                SizedBox(
                  width: width * 0.04,
                )
              ],
            ),
          ),
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
                Observer(builder: (_) {
                  return Text(
                    'Mestre ${controller.nome}',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  );
                }),
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
                  buttons('Solicitar orçamento', '/solicitar',
                      LineAwesomeIcons.paper_plane_o),
                  buttons(
                      'Gerar orçamento', '/base', LineAwesomeIcons.file_pdf_o),
                  buttons('Minhas solicitações', '/solicitacoes',
                      LineAwesomeIcons.sort_amount_asc),
                  buttons(
                      'Meus Orçamentos', '/orcamentos', LineAwesomeIcons.copy),
                  buttons('Meu perfil', '/perfil', LineAwesomeIcons.user),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget buttons(String texto, String rota, IconData icon) {
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
                            child: Center(
                              child: Icon(icon, color: Colors.white),
                            ),
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
