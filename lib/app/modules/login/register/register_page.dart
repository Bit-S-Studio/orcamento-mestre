import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:orcamento_mestre/app/utils/dados_controller.dart';
import 'package:orcamento_mestre/app/utils/theme.dart';
import 'package:provider/provider.dart';
import 'register_controller.dart';

class RegisterPage extends StatefulWidget {
  final String title;
  const RegisterPage({Key key, this.title = "Register"}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<RegisterController>(context);
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height *.005,
              ),
              //logo(),
              SizedBox(
                height: 40,
              ),
              Stack(
                children: [
                  forms(),
                  buttons(),
                  image(),
                ],
              ),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        ));
  }

  Widget image() {
    final controller = Provider.of<RegisterController>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(onTap: () async {
          await controller.getImage();
        }, child: Observer(builder: (_) {
          return Center(
              child: (controller.logoStatus)
                  ? (kIsWeb)
                      ? Container(
                          height: 120,
                          width: 120,
                          child: CircleAvatar(
                              backgroundImage:
                                  NetworkImage(controller.imageFile.path)))
                      : Container(
                          height: 120,
                          width: 120,
                          child: CircleAvatar(
                              backgroundImage: FileImage(
                            File(controller.imageFile.path),
                          )))
                  : CircleAvatar(
                      backgroundColor: Colors.blue[900],
                      radius: 60,
                      child: Text('Foto'),
                    ));
        }))
      ],
    );
  }

  Widget logo() {
    return Container(
      height: 200,
      child: Image.asset('assets/logo.png'),
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
        hintStyle: TextStyle(fontFamily: "WorkSansSemiBold", fontSize: 16.0),
      ),
    );
  }

  Widget forms() {
    final controller = Provider.of<RegisterController>(context);
    return Center(
        child: Padding(
            padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
            child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                elevation: 5.0,
                child: Container(
                    alignment: Alignment.center,
                    constraints: BoxConstraints(
                      maxWidth: 400,
                      minWidth: 280,
                      maxHeight: 280,
                      minHeight: 100,
                    ),
                    color: Colors.white,
                    child: Center(
                        child: Padding(
                            padding: const EdgeInsets.only(
                                left: 20.0, right: 20, top: 50),
                            child: Column(children: <Widget>[
                              textForm(
                                context: context,
                                icon: LineAwesomeIcons.user,
                                obscure: false,
                                hint: 'Nome',
                                onChanged: controller.changeNome,
                              ),
                              Container(
                                width: 250.0,
                                height: 1.0,
                                color: Colors.grey[400],
                              ),
                              textForm(
                                context: context,
                                icon: LineAwesomeIcons.mobile_phone,
                                obscure: false,
                                tipo: TextInputType.phone,
                                hint: 'Telefone',
                                onChanged: controller.changeTelefone,
                              ),
                              Container(
                                width: 250.0,
                                height: 1.0,
                                color: Colors.grey[400],
                              ),
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
                            ])))))));
  }

  Widget buttons() {
    final controller = Provider.of<RegisterController>(context);
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 320,
          ),
          Observer(builder: (_) {
            return Stack(
              children: [
                Visibility(visible: controller.box1, child: button()),
                Visibility(
                    visible: controller.box2,
                    child: CircularProgressIndicator(
                        backgroundColor: Colors.blue[900])),
              ],
            );
          }),
        ],
      ),
    );
  }

  Widget button() {
    final controller = Provider.of<RegisterController>(context);
    final dadosController = Provider.of<DadosController>(context);
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
                  var tipo = 'vazio';
                  var user = await controller.register(
                      controller.nome,
                      controller.email,
                      controller.senha,
                      controller.telefone,
                      controller.imgUrl,
                      tipo);
                  dadosController.uid = user.uid;
                  Modular.to.pushNamed('/pos');
                }
              : () {
                  Fluttertoast.showToast(msg: controller.validate());
                },
          highlightColor: Colors.transparent,
          splashColor: Colors.lightBlueAccent,
          //shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 42.0),
            child: Text(
              "Cadastrar",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25.0,
              ),
            ),
          ),
        ),
      );
    });
  }
}
