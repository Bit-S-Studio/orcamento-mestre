import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    ScreenUtil.getInstance()..init(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue[900],
        onPressed: () {
          Modular.to.pushNamedAndRemoveUntil(
              '/home', (Route<dynamic> route) => false);
        },
        child: Text(
          'Pular',
          style: TextStyle(
            color: Colors.white,
            fontSize: ScreenUtil.instance.setSp(35),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                top: height *.1,
                bottom: height *.05,
                left: width *.04,
                right: width *.04
              ),
              child: Text(
                'E ai Mestre, quer faturar uma grana? Então complete seu cadastro para receber solicitações de orçamento!',
                style: TextStyle(
                  color: Colors.blue[900],
                  fontSize: ScreenUtil.instance.setSp(50),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: height *.05
              ),
              child: Text(
                'Pra começar, diz ai, você é:',
                style: TextStyle(
                  color: Colors.blue[900],
                  fontSize: ScreenUtil.instance.setSp(60),
                ),
                textAlign: TextAlign.center,
              ),
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
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.height;
    final dadosController = Provider.of<DadosController>(context);
    final registerController = Provider.of<RegisterController>(context);
    return Center(
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(
              left: width *.05,
              right: width *.05,
            ),
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
              onPressed: () async {
                await registerController.updateTipo(dadosController.uid, nome);
                dadosController.tipo = nome;
                dadosController.getUser(dadosController.uid);
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
                    color: Colors.white,
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
