import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:orcamento_mestre/app/modules/login/register/register_controller.dart';
import 'package:orcamento_mestre/app/utils/dados_controller.dart';
import 'package:orcamento_mestre/app/utils/users/user_controller.dart';
import 'package:provider/provider.dart';

class PosRegister extends StatefulWidget {
  @override
  _PosRegisterState createState() => _PosRegisterState();
}

class _PosRegisterState extends State<PosRegister> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey[900],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Modular.to.pushNamedAndRemoveUntil(
              '/home', (Route<dynamic> route) => false);
        },
        child: Text(
          'Pular',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: height * 0.02),
            Text(
              'E ai Mestre! Quer faturar uma grana? Então completa seu cadastro pra poder receber solicitações de orçamento',
              style: TextStyle(
                color: Colors.blue[900],
                fontSize: 32,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: height * 0.04),
            Text(
              'Pra começar, diz ai, você é:',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: height * 0.04),
            button('Empresa'),
            SizedBox(height: height * 0.04),
            button('Freelancer'),
          ],
        ),
      ),
    );
  }

  Widget button(String nome) {
    final dadosController = Provider.of<DadosController>(context);
    final registerController = Provider.of<RegisterController>(context);
    return Center(
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                color: Colors.white),
            child: MaterialButton(
              onPressed: () async {
                await registerController.updateTipo(dadosController.uid, nome);
                dadosController.tipo = nome;
                dadosController.getUser(dadosController.uid);
                print(dadosController.uid);
                Modular.to.pushNamed('/dados');
              },
              highlightColor: Colors.transparent,
              splashColor: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 42.0),
                child: Text(
                  nome,
                  style: TextStyle(
                    color: Colors.blue[900],
                    fontSize: 25.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
