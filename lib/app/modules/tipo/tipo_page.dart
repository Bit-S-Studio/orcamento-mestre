import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:orcamento_mestre/app/modules/orcamento/orcamento_controller.dart';
import 'package:orcamento_mestre/app/utils/theme.dart';
import 'package:provider/provider.dart';
import 'tipo_controller.dart';

class TipoPage extends StatefulWidget {
  final String title;
  const TipoPage({Key key, this.title = "Tipo"}) : super(key: key);

  @override
  _TipoPageState createState() => _TipoPageState();
}

class _TipoPageState extends ModularState<TipoPage, TipoController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
                margin: EdgeInsets.all(16),
                child: Center(
                  child: Column(
                    children: [
                      Container(
                        color: Colors.white,
                        height: height *.30,
                        width: width,
                        child: Center(
                          child: Text(
                            'Espaço para Admob',
                            style: TextStyle(
                                color: Colors.white
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: height * .16,
                        width: width * .8,
                        margin: EdgeInsets.only(
                          top: height * .025,
                        ),
                        decoration: BoxDecoration(
                            color: Colors.blue[900],
                            borderRadius: BorderRadius.only(
                               topLeft:  Radius.circular(16),
                              topRight:  Radius.circular(16)
                            )
                        ),
                        child: Center(
                          child: Text('Escolha um padrão para seu orçamento',
                              textAlign: TextAlign.center, style: letraBranca),
                        ),
                      ),
                      Container(
                        color: Colors.blue[900],
                        height: height * .4,
                        width: width * .8,
                        margin: EdgeInsets.only(
                          top: height * .005,
                        ),
                        child: Center(child: dropDown()),
                      ),
                      Container(
                        height: height * .08,
                        width: width * .8,
                        decoration: BoxDecoration(
                            color: Colors.grey[600],
                            borderRadius: BorderRadius.only(
                               bottomLeft:  Radius.circular(16),
                                bottomRight:  Radius.circular(16)
                            )
                        ),
                        child: RaisedButton(
                            color: Colors.grey[600],
                            child: Text(
                              'Continuar',
                              style: TextStyle(color: Colors.white, fontSize: 22),
                            ),
                            shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(16.0)),
                            onPressed: () {
                              Modular.to.pushNamed('/dadosEmpresa');
                            }),
                      )
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget dropDown() {
    final oController = Provider.of<OrcamentoController>(context);
    oController.tipo = 'Desenvolvedor Mobile';
    return Observer(builder: (_) {
      return DropdownButton<String>(
        value: oController.tipo,
        icon: Icon(
          Icons.arrow_downward,
          color: Colors.white,
        ),
        dropdownColor: Colors.grey[800],
        iconSize: 24,
        elevation: 16,
        style: TextStyle(color: Colors.deepPurple),
        onChanged: (String newValue) {
          oController.tipo = newValue;
        },
        items:
            controller.listTipos.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          );
        }).toList(),
      );
    });
  }
}
