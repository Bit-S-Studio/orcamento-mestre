import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:orcamento_mestre/app/utils/dados_controller.dart';
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
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.height;
    ScreenUtil.getInstance()..init(context);
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Container(
        child: Column(
          children: [
            Stack(
              children: <Widget>[
                Container(height: height, width: width, child: background()),
                Container(
                  height: height * .2,
                  width: width,
                  margin:
                      EdgeInsets.only(left: width * .03, right: width * .03),
                  child: Center(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: height * .065,
                            margin: EdgeInsets.only(
                                top: height * .13, right: width * .04),
                            child: wellcome(),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Container(
                              margin: EdgeInsets.only(
                                top: height * .1,
                              ),
                              child: buttonsUp()),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                    height: height,
                    width: width,
                    padding: EdgeInsets.only(top: height * .25),
                    child: Stack(
                      overflow: Overflow.visible,
                      children: [
                        page(),
                        Positioned(
                            bottom: height * .615,
                            left: width * .4,
                            child: Container(child: foto()))
                      ],
                    )),
              ],
            ),
          ],
        ),
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
    return Center(
      child: StreamBuilder<Object>(
          stream: null,
          builder: (context, snapshot) {
            return CircleAvatar(
              backgroundColor: Colors.white,
              radius: 50,
              child: CircleAvatar(
                backgroundImage: NetworkImage(controller.imagem.toString()),
                radius: 56,
              ),
            );
          }),
    );
  }

  Widget page() {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.height;
    final controller = Provider.of<UserController>(context);
    var teste = controller.setUser();
    print(teste);
    return Container(
      padding: EdgeInsets.only(
          top: height * .09,
          bottom: height * .08,
          left: width * .045,
          right: width * .045),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: Colors.grey[100]),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  buttons('Solicitar orçamento', '/solicitar',
                      LineAwesomeIcons.paper_plane_o),
                  Container(
                    height: height * .015,
                    width: width,
                    padding: EdgeInsets.only(left: width * .33),
                    child: Text(
                      'Em Desenvolvimento',
                      style: TextStyle(
                        fontSize: ScreenUtil.instance.setSp(20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  buttons(
                      'Gerar orçamento', '/base', LineAwesomeIcons.file_pdf_o),
                  Container(
                    height: height * .015,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  buttons('Minhas solicitações', '/solicitacoes',
                      LineAwesomeIcons.sort_amount_asc),
                  Container(
                    height: height * .016,
                    width: width,
                    padding: EdgeInsets.only(left: width * .33),
                    child: Text(
                      'Em Desenvolvimento',
                      style: TextStyle(
                        fontSize: ScreenUtil.instance.setSp(20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  buttons(
                      'Meus Orçamentos', '/orcamentos', LineAwesomeIcons.copy),
                  Container(
                    height: height * .015,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  buttons('Meu perfil', '/perfil', LineAwesomeIcons.user),
                  Container(
                    height: height * .015,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buttons(String texto, String rota, IconData icon) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.height;
    return Center(
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: height * .01,
            ),
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                child: MaterialButton(
                  onPressed: () async {
                    Modular.to.pushNamedAndRemoveUntil(
                        rota, ModalRoute.withName('/'));
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
                            style: TextStyle(
                              fontSize: ScreenUtil.instance.setSp(40),
                            ),
                          ),
                          Flexible(fit: FlexFit.tight, child: SizedBox()),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Icon(Icons.arrow_forward_ios,
                                size: 16, color: Colors.black),
                          )
                        ]),
                  ),
                )),
          ),
        ],
      ),
    );
  }

  Widget buttonsUp() {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.height;
    return Container(
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
        ],
      ),
    );
  }

  Widget wellcome() {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.height;
    final controller = Provider.of<UserController>(context);
    var teste = controller.setUser();
    print(teste);
    return Container(
      child: Column(
        children: [
          Text(
            'Seja Bem-vindo!',
            style: TextStyle(
              color: Colors.white,
              fontSize: ScreenUtil.instance.setSp(50),
            ),
            textAlign: TextAlign.left,
          ),
          Observer(builder: (_) {
            return Text(
              'Mestre ${controller.nome}',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: ScreenUtil.instance.setSp(50),
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            );
          }),
        ],
      ),
    );
  }
}
