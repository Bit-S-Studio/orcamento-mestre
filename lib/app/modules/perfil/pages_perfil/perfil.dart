import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:orcamento_mestre/app/modules/perfil/perfil_controller.dart';
import 'package:orcamento_mestre/app/utils/users/user_controller.dart';
import 'package:provider/provider.dart';

class Perfil extends StatefulWidget {
  @override
  _PerfilState createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<UserController>(context);
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Flexible(flex: 2, child: Icon(Icons.email)),
            Flexible(flex: 8, child: Text(controller.email))
          ],
        ),
        Row(
          children: <Widget>[
            Flexible(flex: 2, child: Icon(Icons.phone)),
            Flexible(flex: 8, child: Text(controller.telefone))
          ],
        ),
        buttons('Meus Dados', 1, LineAwesomeIcons.user),
        buttons('Meus Clientes', 2, LineAwesomeIcons.users),
        buttons('Meu Plano', 3, LineAwesomeIcons.plane),
        buttons('Mudar senha', 4, LineAwesomeIcons.lock),
        buttons('Deslogar', 5, LineAwesomeIcons.power_off),
      ],
    );
  }

  Widget buttons(String texto, int index, IconData icon) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.height;
    final controller = Provider.of<PerfilController>(context);
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
                  onPressed: (index == 5)
                      ? () async {
                          FirebaseAuth.instance.signOut();
                          Modular.to.pushNamed('/login');
                        }
                      : () async {
                          controller.updateCurrentIndex(index);
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
}
