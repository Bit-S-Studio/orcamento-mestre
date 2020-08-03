import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:orcamento_mestre/app/modules/home/home_page.dart';
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
      body: Column(
        children: <Widget>[
          SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Container(
                    color: Colors.blue[900],
                    height: height * .08,
                    width: width * .8,
                    margin: EdgeInsets.only(
                      top: height * .18,
                    ),
                    padding: EdgeInsets.only(
                      left: height * .02,
                      top: height * .026,
                    ),
                    child: Text('Escolha um padrão para seu orçamento',
                        textAlign: TextAlign.center, style: letraBranca),
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
                    color: Colors.grey[600],
                    height: height * .08,
                    width: width * .8,
                    child: RaisedButton(
                        child: Text(
                          'Continuar',
                          style: TextStyle(color: Colors.white, fontSize: 22),
                        ),
                        onPressed: () {
                          Modular.to.pushNamed('/tipo/dadosEmpresa');
                        }),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget dropDown() {
    final oController = Provider.of<OrcamentoController>(context);
    String dropdownValue = 'Desenvolvedor Mobile';
    return DropdownButton<String>(
      value: dropdownValue,
      icon: Icon(
        Icons.arrow_downward,
        color: Colors.white,
      ),
      dropdownColor: Colors.black87,
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Colors.deepPurple),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
          oController.tipo = newValue;
        });
      },
      items: controller.listTipos.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        );
      }).toList(),
    );
  }
}
