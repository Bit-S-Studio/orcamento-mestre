import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:orcamento_mestre/app/modules/login/register/register_controller.dart';
import 'package:provider/provider.dart';

class PosRegister extends StatefulWidget {
  @override
  _PosRegisterState createState() => _PosRegisterState();
}

class _PosRegisterState extends State<PosRegister> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'E ai Mestre! Quer faturar uma grana? Então completa seu cadastro pra poder receber solicitações de orçamento',
              style: TextStyle(
                color: Colors.blue[900],
                fontSize: 32,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 48),
            Text(
              'Pra começar, diz ai, você é:',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24),
            button('Empresa'),
            SizedBox(height: 24),
            button('Freelancer'),
            SizedBox(height: 200),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: FlatButton(
                  onPressed: () {
                    Modular.to.pushNamedAndRemoveUntil(
                        '/home', (Route<dynamic> route) => false);
                  },
                  child: Text(
                    'Pular >>',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget button(String nome) {
    final controller = Provider.of<RegisterController>(context);
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
                controller.tipo = nome;
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
