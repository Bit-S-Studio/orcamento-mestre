import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:orcamento_mestre/app/modules/dadosProjeto/addItem.dart';
import 'package:orcamento_mestre/app/modules/dadosProjeto/projeto_controller.dart';
import 'package:orcamento_mestre/app/modules/orcamento/orcamento_controller.dart';
import 'package:provider/provider.dart';

import 'itemModel.dart';

class ItemList extends StatefulWidget {
  final String categoria;
  final String descricao;
  final double valor;
  final DateTime tempo;
  final ItemModel itemModel;

  const ItemList({
    Key key,
    @required this.categoria,
    @required this.descricao,
    @required this.valor,
    @required this.tempo,
    @required this.itemModel,
  }) : super(key: key);

  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.height;
    final oController = Provider.of<OrcamentoController>(context);
    final controller = Provider.of<ProjetoController>(context);
    var itemheight = height * 0.2;
    controller.itemHeight = itemheight;
    String format = DateFormat('HH:mm').format(widget.tempo);
    return Container(
        height: height * 0.175,
        width: width,
        margin: EdgeInsets.only(
            top: height * .015,
            bottom: height * .015,
            left: width * .015,
            right: width * .015),
        decoration: BoxDecoration(
          color: Colors.blue[900],
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: Container(
          height: height,
          width: width,
          padding: EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                children: [
                  Flexible(
                    flex: 7,
                    child: Container(
                      height: height * .036,
                      margin: EdgeInsets.only(
                          top: height * .005,
                          bottom: height * .005,
                          right: width * .005),
                      child: Text(
                        widget.descricao,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    height: height * .03,
                    width: width * .001,
                  ),
                  Flexible(
                    flex: 3,
                    child: Container(
                        margin: EdgeInsets.only(
                            top: height * .005,
                            bottom: height * .005,
                            left: width * .012),
                        child: Text(
                          'R\$ ${widget.valor.toStringAsFixed(2)}',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        )),
                  ),
                ],
              ),
              Container(
                color: Colors.white,
                height: height * .001,
                width: width,
              ),
              Container(
                height: height * .05,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Flexible(
                      flex: 7,
                      child: Container(
                        margin: EdgeInsets.only(
                            top: height * .005,
                            bottom: height * .005,
                            right: width * .25),
                        child: Text(
                          'Tempo de execução',
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.only(
                          top: height * .005,
                          bottom: height * .005,
                        ),
                        child: Icon(
                          Icons.timer,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: Container(
                        margin: EdgeInsets.only(
                          top: height * .005,
                          bottom: height * .005,
                        ),
                        child: Text(
                          format,
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                height: height * .001,
                width: width,
              ),
              Stack(
                children: [
                  Container(
                    width: width,
                    margin:
                        EdgeInsets.only(top: height * .001, left: width * .44),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Container(
                          height: height * .04,
                          width: width * .045,
                          child: IconButton(
                              icon: Icon(
                                Icons.edit,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                showAlertDialog1(
                                    controller,
                                    context,
                                    widget.categoria,
                                    widget.descricao,
                                    widget.valor,
                                    widget.tempo);
                              }),
                        ),
                        Container(
                          height: height * .04,
                          width: width * .045,
                          child: IconButton(
                              icon: Icon(
                                Icons.delete_forever,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                controller.listItens.remove(widget.itemModel);
                              }),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }

  showAlertDialog1(controller, BuildContext context, String categoria,
      String descricao, double valor, DateTime tempo) {
    controller.listItens.remove(widget.itemModel);
    String valorS = '$valor';
    String tempoS = DateFormat('HH:mm').format(widget.tempo);
    controller.categoriaController.text = categoria;
    controller.itemController.text = descricao;
    controller.valorController.text = valorS;
    controller.tempoController.text = tempoS;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AddItem();
      },
    );
  }
}
