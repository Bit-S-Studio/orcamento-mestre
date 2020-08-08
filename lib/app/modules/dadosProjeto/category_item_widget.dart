import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:orcamento_mestre/app/modules/dadosProjeto/projeto_controller.dart';
import 'package:orcamento_mestre/app/modules/orcamento/orcamento_controller.dart';
import 'package:provider/provider.dart';

import 'item_description_widget.dart';

class CategoryItemWidget extends StatefulWidget {
  @override
  _CategoryItemWidgetState createState() => _CategoryItemWidgetState();
}

class _CategoryItemWidgetState
    extends ModularState<CategoryItemWidget, ProjetoController> {
  final _categoryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final oController = Provider.of<OrcamentoController>(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Stack(
          children: [
            Container(
              color: Colors.blue[900],
              height: height * .20,
              width: width,
            ),
            Container(
              margin: EdgeInsets.only(
                top: height * .01,
              ),
              child: Row(
                children: [
                  Container(
                    height: height * .03,
                    width: width * .40,
                    margin: EdgeInsets.only(
                        top: height * .01,
                        left: width * .015,
                        right: width * .015),
                    child: Text(
                      'Categoria',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    height: height * .06,
                    width: width * .08,
                    child: Observer(builder: (_) {
                      return IconButton(
                          icon: Icon(
                            Icons.add_circle,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            String categoria =
                                controller.categoriaController.text;
                            controller.indexCategoria =
                                controller.indexCategoria + 1;
                            oController.categoriasProjeto.add(categoria);
                          });
                    }),
                  ),
                  Container(
                    height: height * .06,
                    width: width * .08,
                    child: Observer(builder: (_) {
                      return IconButton(
                          icon: Icon(
                            Icons.delete_forever,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            String categoria =
                                controller.categoriaController.text;
                            oController.categoriasProjeto.remove(categoria);
                            controller.indexCategoria =
                                controller.indexCategoria - 1;
                          });
                    }),
                  ),
                ],
              ),
            ),
            Container(
              height: height * .08,
              width: width,
              margin: EdgeInsets.only(
                  top: height * .075, left: width * .015, right: width * .015),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  boxShadow: [
                    new BoxShadow(
                        color: Colors.black.withAlpha(70),
                        offset: const Offset(3.0, 10.0),
                        blurRadius: 15.0)
                  ]),
              child: Container(
                height: height * .06,
                width: width * .32,
                margin: EdgeInsets.only(
                    top: height * .015,
                    bottom: height * .015,
                    left: width * .02,
                    right: width * .02),
                child: Center(
                  child: TextFormField(
                    controller: controller.categoriaController,
                    decoration: InputDecoration(
                      contentPadding: new EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      labelText: "Categoria",
                      labelStyle: TextStyle(fontSize: 12),
                      border: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(const Radius.circular(12.0)),
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
            ),
          ],
        ),
        Observer(builder: (_) {
          return Container(
            height: controller.itemHeight * controller.indexItem,
            width: width,
            child: ListView.builder(
              itemCount: controller.indexItem,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ItemDescritionWidget();
              },
            ),
          );
        }),
        Container(height: 12, width: width, color: Colors.grey[900])
      ],
    );
  }
}
