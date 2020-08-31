import 'package:combos/combos.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:orcamento_mestre/app/utils/users/user_controller.dart';
import 'package:provider/provider.dart';
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
    final controller = Provider.of<ClientesController>(context);
    final userController = Provider.of<UserController>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: height * .62,
            child: Column(
              children: [
                Observer(builder: (_) {
                  return Row(
                    children: <Widget>[
                      Flexible(
                          flex: 9,
                          child: (controller.status)
                              ? Container(
                                  height: height * .06,
                                  margin: EdgeInsets.only(
                                    top: height * .015,
                                  ),
                                  child: TextFormField(
                                    controller: controller.nomeController,
                                    onChanged: (newNome) {
                                      controller.nome = newNome;
                                    },
                                    decoration: InputDecoration(
                                      contentPadding: new EdgeInsets.symmetric(
                                          vertical: 10.0, horizontal: 10.0),
                                      labelText: "Nome do cliente",
                                      labelStyle: TextStyle(
                                        color: Colors.blue
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: const BorderRadius.all(
                                            const Radius.circular(12.0)),
                                        borderSide: BorderSide(
                                            color: Colors.grey[500], width: 2.0
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: const BorderRadius.all(
                                            const Radius.circular(12.0)),
                                        borderSide: BorderSide(
                                          color: Colors.blue[900], width: 3.0
                                        ),
                                      ),
                                    ),
                                    validator: (text) {
                                      if (text.isEmpty)
                                        return "O campo nome, está vazio";
                                    },
                                  ),
                                )
                              : TypeaheadCombo(
                                  selected: controller.nome,
                                  getList: (text) async {
                                    await controller
                                        .getClientes(userController.uid);
                                    return await controller
                                        .getSuggestions(text);
                                  },
                                  itemBuilder: (context, parameters, item,
                                          selected, text) =>
                                      ListTile(title: Text(item ?? '<Empty>')),
                                  onSelectedChanged: (item) {
                                    setState(() async {
                                      controller.nome = item;
                                      await controller
                                          .getCliente(userController.uid);
                                    });
                                  },
                                  onItemTapped: (item) {
                                    controller.nome = item;
                                  },
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: const BorderRadius.all(
                                            const Radius.circular(12.0)),
                                      ),
                                      hintText: 'Nome do cliente'),
                                  getItemText: (item) => item,
                                )),
                      Flexible(
                          flex: 1,
                          child: (controller.status)
                              ? IconButton(
                                  icon: Icon(LineAwesomeIcons.search),
                                  onPressed: () {
                                    controller.status = false;
                                  })
                              : IconButton(
                                  icon: Icon(LineAwesomeIcons.close),
                                  onPressed: () {
                                    controller.status = true;
                                  })),
                    ],
                  );
                }),
                Container(
                  height: height * .06,
                  margin: EdgeInsets.only(
                    top: height * .015,
                  ),
                  child: TextFormField(
                    controller: controller.emailController,
                    onChanged: (newEmail) {
                      controller.email = newEmail;
                    },
                    decoration: InputDecoration(
                      contentPadding: new EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      labelText: "E-mail",
                      labelStyle: TextStyle(
                          color: Colors.blue
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                            const Radius.circular(12.0)),
                        borderSide: BorderSide(
                            color: Colors.grey[500], width: 2.0
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                            const Radius.circular(12.0)),
                        borderSide: BorderSide(
                            color: Colors.blue[900], width: 3.0
                        ),
                      ),
                    ),
                    validator: (text) {
                      if (text.isEmpty) return "O campo Email, está vazio";
                    },
                  ),
                ),
                Container(
                  height: height * .06,
                  margin: EdgeInsets.only(
                    top: height * .015,
                  ),
                  child: TextFormField(
                    controller: controller.telefoneController,
                    onChanged: (newTelefone) {
                      controller.telefone = newTelefone;
                    },
                    decoration: InputDecoration(
                      contentPadding: new EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      labelText: "Telefone",
                      labelStyle: TextStyle(
                          color: Colors.blue
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                            const Radius.circular(12.0)),
                        borderSide: BorderSide(
                            color: Colors.grey[500], width: 2.0
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                            const Radius.circular(12.0)),
                        borderSide: BorderSide(
                            color: Colors.blue[900], width: 3.0
                        ),
                      ),
                    ),
                    validator: (text) {
                      if (text.isEmpty) return "O campo telefone, está vazio";
                    },
                  ),
                ),
                Row(
                  children: <Widget>[
                    Flexible(
                      flex: 7,
                      child: Container(
                        height: height * .06,
                        margin: EdgeInsets.only(
                            top: height * .015, right: width * 0.015),
                        child: TextFormField(
                          controller: controller.enderecoController,
                          onChanged: (newEndereco) {
                            controller.endereco = newEndereco;
                          },
                          decoration: InputDecoration(
                            contentPadding: new EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 10.0),
                            labelText: "Endereço",
                            labelStyle: TextStyle(
                                color: Colors.blue
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                  const Radius.circular(12.0)),
                              borderSide: BorderSide(
                                  color: Colors.grey[500], width: 2.0
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                  const Radius.circular(12.0)),
                              borderSide: BorderSide(
                                  color: Colors.blue[900], width: 3.0
                              ),
                            ),
                          ),
                          validator: (text) {
                            if (text.isEmpty)
                              return "O campo endereço, está vazio";
                          },
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 3,
                      child: Container(
                        height: height * .06,
                        margin: EdgeInsets.only(
                          top: height * .015,
                        ),
                        child: TextFormField(
                          controller: controller.numeroController,
                          onChanged: (newNumero) {
                            controller.numero = newNumero;
                          },
                          decoration: InputDecoration(
                            contentPadding: new EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 10.0),
                            labelText: "N°",
                            labelStyle: TextStyle(
                                color: Colors.blue
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                  const Radius.circular(12.0)),
                              borderSide: BorderSide(
                                  color: Colors.grey[500], width: 2.0
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                  const Radius.circular(12.0)),
                              borderSide: BorderSide(
                                  color: Colors.blue[900], width: 3.0
                              ),
                            ),
                          ),
                          validator: (text) {
                            if (text.isEmpty)
                              return "O campo Numero, está vazio";
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: height * .25,
                  width: width,
                  margin: EdgeInsets.only(
                      top: height * .05,
                    left: width *.03,
                    right: width *.03
                  ),
                  padding: EdgeInsets.only(top: height * .09),
                  child: Text(
                    'Clique na lupa para pesquisar um cliente existente, ou cadastre um novo cliente',
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
