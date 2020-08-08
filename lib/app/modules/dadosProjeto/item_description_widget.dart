import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:orcamento_mestre/app/modules/dadosProjeto/itemModel.dart';
import 'package:orcamento_mestre/app/modules/dadosProjeto/projeto_controller.dart';
import 'package:orcamento_mestre/app/modules/orcamento/orcamento_controller.dart';
import 'package:provider/provider.dart';

class ItemDescritionWidget extends StatefulWidget {
  @override
  _ItemDescritionWidgetState createState() => _ItemDescritionWidgetState();
}

class _ItemDescritionWidgetState
    extends ModularState<ItemDescritionWidget, ProjetoController> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.height;
    final oController = Provider.of<OrcamentoController>(context);
    TextEditingController _descricaoController = TextEditingController();
    TextEditingController _valorController = TextEditingController();
    TextEditingController _tempoController = TextEditingController();
    var itemheight = height * 0.2;
    controller.itemHeight = itemheight;
    return Observer(builder: (context) {
      return Container(
        color: Colors.blue[900],
        child: Container(
          height: height * 0.16,
          width: width,
          margin: EdgeInsets.only(
              top: height * .015,
              bottom: height * .015,
              left: width * .015,
              right: width * .015),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(12)),
              boxShadow: [
                new BoxShadow(
                    color: Colors.black.withAlpha(70),
                    offset: const Offset(3.0, 10.0),
                    blurRadius: 15.0)
              ]),
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Container(
                        height: height * .06,
                        width: width * .32,
                        margin: EdgeInsets.only(left: width * .02),
                        child: Center(
                          child: TextFormField(
                            controller: _descricaoController,
                            decoration: InputDecoration(
                              contentPadding: new EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 10.0),
                              labelText: "Descrição do Ítem",
                              labelStyle: TextStyle(fontSize: 12),
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
                                return "O campo Descrição do ítem está vazio!";
                            },
                          ),
                        ),
                      ),
                      Container(
                        height: height * .06,
                        width: width * .13,
                        margin: EdgeInsets.only(left: width * .005),
                        child: Center(
                          child: TextFormField(
                            controller: _valorController,
                            decoration: InputDecoration(
                              contentPadding: new EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 10.0),
                              labelText: "R\$ 0.000,00",
                              labelStyle: TextStyle(fontSize: 12),
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
                                return "O campo Valor está vazio!";
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: height * .06,
                        width: width * .32,
                        margin: EdgeInsets.only(
                            top: height * .01, left: width * .02),
                        decoration: BoxDecoration(
                            color: Colors.blue[900],
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                        child: Center(
                            child: Text(
                          'Estimativa de tempo de execução',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        )),
                      ),
                      Container(
                        height: height * .06,
                        width: width * .13,
                        margin: EdgeInsets.only(
                            top: height * .01, left: width * .005),
                        child: Center(
                          child: TextFormField(
                            controller: _tempoController,
                            decoration: InputDecoration(
                              contentPadding: new EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 10.0),
                              labelText: "12:30h",
                              labelStyle: TextStyle(fontSize: 12),
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
                                return "O campo Valor está vazio!";
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                height: height * .12,
                width: width * .06,
                margin: EdgeInsets.only(left: width * .02),
                decoration: BoxDecoration(
                    color: Colors.blue[900],
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: height * .06,
                      width: width * .1,
                      child: Observer(builder: (_) {
                        return IconButton(
                            icon: Icon(
                              Icons.save,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              controller.indexItem = controller.indexItem + 1;
                              String categoria;
                              String item = controller.itemController.text;
                              double valor =
                                  double.parse(controller.valorController.text);
                              oController.listItens
                                  .add(ItemModel(item, valor, categoria));
                            });
                      }),
                    ),
                    Container(
                      height: height * .06,
                      width: width * .1,
                      child: Observer(builder: (_) {
                        return IconButton(
                            icon: Icon(
                              Icons.delete_forever,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              String categoria;
                              String item = controller.itemController.text;
                              double valor =
                                  double.parse(controller.valorController.text);
                              oController.listItens
                                  .remove(ItemModel(item, valor, categoria));
                            });
                      }),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
