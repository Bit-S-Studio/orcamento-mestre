import 'package:combos/combos.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'clientes_controller.dart';

class ClientesPage extends StatefulWidget {
  final String title;
  const ClientesPage({Key key, this.title = "Clientes"}) : super(key: key);

  @override
  _ClientesPageState createState() => _ClientesPageState();
}

class _ClientesPageState
    extends ModularState<ClientesPage, ClientesController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    ScreenUtil.getInstance()..init(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          //TypeaheadCombo(

          //),
          Container(
            height: height *.62,
            child: Column(
              children: [
                Container(
                  child: TextFormField(
                    //controller: controller.nomeController,
                    //onChanged: (newName) {
                    //controller.nome = newName;
                    //},
                    decoration: InputDecoration(
                      contentPadding: new EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      labelText: "Nome do Cliente",
                      border: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                            const Radius.circular(12.0)),
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    validator: (text) {
                      if (text.isEmpty)
                        return "O campo Nome do Cliente, está vazio";
                    },
                  ),
                ),
                Container(
                  height: height * .06,
                  margin: EdgeInsets.only(
                    top: height *.015,
                  ),
                  child: TextFormField(
                    //controller: controller.nomeController,
                    //onChanged: (newName) {
                    //controller.nome = newName;
                    //},
                    decoration: InputDecoration(
                      contentPadding: new EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      labelText: "Endereço",
                      border: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                            const Radius.circular(12.0)),
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    validator: (text) {
                      if (text.isEmpty)
                        return "O campo Endereço, está vazio";
                    },
                  ),
                ),
                Container(
                  height: height * .06,
                  margin: EdgeInsets.only(
                    top: height *.015,
                  ),
                  child: TextFormField(
                    //controller: controller.nomeController,
                    //onChanged: (newName) {
                    //controller.nome = newName;
                    //},
                    decoration: InputDecoration(
                      contentPadding: new EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      labelText: "Telefone",
                      border: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                            const Radius.circular(12.0)),
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    validator: (text) {
                      if (text.isEmpty)
                        return "O campo Telefone, está vazio";
                    },
                  ),
                ),
                Container(
                  height: height * .06,
                  margin: EdgeInsets.only(
                    top: height *.015,
                  ),
                  child: TextFormField(
                    //controller: controller.nomeController,
                    //onChanged: (newName) {
                    //controller.nome = newName;
                    //},
                    decoration: InputDecoration(
                      contentPadding: new EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      labelText: "Email",
                      border: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                            const Radius.circular(12.0)),
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    validator: (text) {
                      if (text.isEmpty)
                        return "O campo Email, está vazio";
                    },
                  ),
                ),
                Container(
                  height: height *.25,
                  width: width,
                  margin: EdgeInsets.only(
                    top: height *.05
                  ),
                  padding: EdgeInsets.only(
                    top: height *.09
                  ),
                  child: Text(
                    'Pesquise por um cliente existente, ou adicione um novo cliente',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: ScreenUtil.instance.setSp(50),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
