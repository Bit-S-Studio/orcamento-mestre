import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:orcamento_mestre/app/modules/clientes/clientes_controller.dart';
import 'package:orcamento_mestre/app/utils/dados_controller.dart';
import 'package:orcamento_mestre/app/utils/theme.dart';
import 'package:orcamento_mestre/app/utils/users/user_controller.dart';
import 'package:provider/provider.dart';
import 'login_controller.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

class LoginPage extends StatefulWidget {
  final String title;

  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    ScreenUtil.getInstance()..init(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  height: height * .34,
                  width: width,
                  margin: EdgeInsets.only(bottom: height * .03),
                  child: logo()),
              Stack(
                overflow: Overflow.visible,
                children: [
                  Positioned(
                      child: Container(
                          //color: Colors.pink,
                          height: height * .28,
                          width: width,
                          margin: EdgeInsets.only(
                            left: width *.02,
                            right: width *.02,
                          ),
                          child: forms())),
                  Positioned(
                      child: Container(
                          height: height * .1,
                          width: width,
                          margin: EdgeInsets.only(
                            top: height *.24,
                          ),
                          child: buttons())),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: height * .05),
                child: buttons2(),
              )
            ],
          ),
        ));
  }

  Widget logo() {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.height;
    return Container(
      height: height * .2,
      width: width * .2,
      margin: EdgeInsets.only(top: height * .13),
      child: Image.asset(
        'assets/logo_orcamento_mestre.png',
        scale: 1.0,
      ),
    );
  }

  Widget textForm(
      {BuildContext context,
      String hint,
      TextInputType tipo,
      bool obscure,
      IconData icon,
      IconData iconObscure,
      Widget iconButton,
      onChanged}) {
    return TextField(
      keyboardType: tipo,
      style: letraPreta,
      onChanged: onChanged,
      obscureText: obscure,
      decoration: InputDecoration(
        border: InputBorder.none,
        icon: Icon(
          icon,
          color: Colors.black,
          size: 17.0,
        ),
        hintText: hint,
        suffixIcon: iconButton,
        hintStyle: TextStyle(
          fontFamily: "WorkSansSemiBold",
          fontSize: ScreenUtil.instance.setSp(50),
        ),
      ),
    );
  }

  Widget forms() {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.height;
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        elevation: 8.0,
        child: Container(
            height: height * .25,
            width: width * .55,
            decoration: BoxDecoration(
                color: Colors.white,
              borderRadius: BorderRadius.circular(18)
            ),
            child: Center(
                child: Padding(
                    padding:
                        const EdgeInsets.only(left: 20.0, right: 20, top: 26),
                    child: Column(children: <Widget>[
                      textForm(
                        context: context,
                        icon: LineAwesomeIcons.envelope,
                        obscure: false,
                        tipo: TextInputType.emailAddress,
                        hint: 'Email',
                        onChanged: controller.changeEmail,
                      ),
                      Container(
                        width: 250.0,
                        height: 1.0,
                        color: Colors.grey[400],
                      ),
                      Observer(builder: (_) {
                        return textForm(
                            context: context,
                            tipo: TextInputType.visiblePassword,
                            hint: 'Senha',
                            obscure: controller.senhaObscure,
                            icon: LineAwesomeIcons.lock,
                            iconButton: IconButton(
                                icon: Icon(controller.senhaObscure
                                    ? LineAwesomeIcons.eye_slash
                                    : LineAwesomeIcons.eye),
                                onPressed: () {
                                  controller.senhaObscure =
                                      !controller.senhaObscure;
                                }),
                            onChanged: controller.changeSenha);
                      }),
                    ])))));
  }

  Widget buttons() {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.height;
    return Center(
      child: Column(
        children: [
          Observer(builder: (_) {
            return Stack(
              children: [
                Visibility(visible: controller.box1, child: button()),
                Visibility(
                    visible: controller.box2,
                    child: Container(
                      child: CircularProgressIndicator(
                          ),
                    )),
              ],
            );
          }),
        ],
      ),
    );
  }

  Widget button() {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.height;
    final userController = Provider.of<UserController>(context);
    final dadosController = Provider.of<DadosController>(context);
    final clientesController = Provider.of<ClientesController>(context);
    return Observer(builder: (_) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.blue[900],
          borderRadius: BorderRadius.all(Radius.circular(12)),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black,
              offset: Offset(1.0, 6.0),
              blurRadius: 20.0,
            ),
          ],
        ),
        child: MaterialButton(
            onPressed: controller.isValid
                ? () async {
                    controller.box1 = false;
                    controller.box2 = true;
                    var user = await controller.logar(
                        controller.email, controller.senha, context);
                    print(user.uid);
                    dadosController.uid = user.uid;
                    clientesController.userId = user.uid;
                    await dadosController.getUser(user.uid);
                    await userController.getUser(user.uid);
                    print(dadosController.tipo);
                    await dadosController.getDados(
                        user.uid, dadosController.tipo);
                    Modular.to.pushReplacementNamed('/home');
                  }
                : () {
                    Fluttertoast.showToast(msg: controller.validate());
                  },
            highlightColor: Colors.transparent,
            splashColor: Colors.black,
            //shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
            child: Container(
              width: width * .2,
              child: Text(
                "Entrar",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                ),
              ),
            )),
      );
    });
  }

  Widget buttons2() {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 12,
          ),
          Container(
              child: FlatButton(
            onPressed: () {
              Modular.to.pushNamed('/reset');
            },
            child: Text('Esqueceu a senha?', style: letraPreta),
          )),
          SizedBox(
            height: 08,
          ),
          Container(
              child: FlatButton(
            onPressed: () {
              Modular.to.pushNamed('/register');
            },
            child: RichText(
              text: TextSpan(
                  text: 'Ainda não tem uma Conta?',
                  style: letraPreta,
                  children: <TextSpan>[
                    TextSpan(text: ' Clique aqui', style: letraAzul)
                  ]),
            ),
          )),
        ],
      ),
    );
  }
}

class CadastroController {}
