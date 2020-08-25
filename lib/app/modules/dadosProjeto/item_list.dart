import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:orcamento_mestre/app/modules/dadosProjeto/addItem.dart';
import 'package:orcamento_mestre/app/modules/dadosProjeto/projeto_controller.dart';
import 'package:provider/provider.dart';

import 'itemModel.dart';

class ItemList extends StatefulWidget {
  final String categoria;
  final String descricao;
  final double valor;
  final String tempo;
  final String medida;
  final double quantidade;
  final ItemModel itemModel;
  final double valorTotal;

  const ItemList({
    Key key,
    @required this.categoria,
    @required this.descricao,
    @required this.valor,
    @required this.valorTotal,
    this.tempo,
    @required this.itemModel,
    this.medida,
    this.quantidade,
  }) : super(key: key);

  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.height;
    final controller = Provider.of<ProjetoController>(context);
    var itemheight = height * 0.2;
    controller.itemHeight = itemheight;
    return Container(
        height: (widget.tempo != '') ? height * 0.18 : height * 0.12,
        width: width,
        margin: EdgeInsets.only(
            top: height * .015,
            bottom: height * .015,
            left: width * .015,
            right: width * .015),
        decoration: BoxDecoration(
            color: Colors.blue[900],
            borderRadius: BorderRadius.all(Radius.circular(12)),
            boxShadow: [
              new BoxShadow(
                  color: Colors.black.withAlpha(70),
                  offset: const Offset(3.0, 10.0),
                  blurRadius: 15.0)
            ]),
        child: Container(
          height: height,
          width: width,
          padding: EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                children: [
                  (widget.quantidade != 0)
                      ? Flexible(
                          flex: 10,
                          child: Container(
                            height: height * .036,
                            width: width * 5,
                            margin: EdgeInsets.only(
                                top: height * .005,
                                bottom: height * .005,
                                right: width * .005),
                            child: Text(
                              '${widget.quantidade}',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                          ),
                        )
                      : Container(),
                  (widget.medida != '')
                      ? Flexible(
                          flex: 10,
                          child: Container(
                            height: height * .036,
                            width: width * 5,
                            margin: EdgeInsets.only(
                                top: height * .005,
                                bottom: height * .005,
                                right: width * .005),
                            child: Text(
                              '${widget.medida}',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                          ),
                        )
                      : Container(),
                  Flexible(
                    flex: 60,
                    child: Container(
                      height: height * .036,
                      width: width * 5,
                      margin: EdgeInsets.only(
                          top: height * .005,
                          bottom: height * .005,
                          right: width * .005),
                      child: Text(
                        widget.descricao,
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(
                      color: Colors.white,
                      height: height * .03,
                      width: width * .001,
                    ),
                  ),
                  Flexible(
                    flex: 30,
                    child: Container(
                        height: height * .03,
                        margin: EdgeInsets.only(
                            top: height * .005,
                            bottom: height * .005,
                            left: width * .012),
                        child: Text(
                          'R\$ ${widget.valor.toStringAsFixed(2)}',
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        )),
                  ),
                ],
              ),
              (widget.tempo != '')
                  ? Container(
                      color: Colors.white,
                      height: height * .001,
                      width: width,
                    )
                  : Container(),
              (widget.tempo != '')
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Flexible(
                          flex: 10,
                          child: Container(
                            height: height * .03,
                            margin: EdgeInsets.only(
                                top: height * .005,
                                bottom: height * .005,
                                right: width * .05),
                            child: Text(
                              'Tempo de execução',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
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
                              widget.tempo,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                          ),
                        ),
                      ],
                    )
                  : Container(),
              Container(
                color: Colors.white,
                height: height * .001,
                width: width,
              ),
              Stack(
                children: [
                  Container(
                    width: width,
                    margin: EdgeInsets.only(top: height * .001),
                    child: Row(
                      children: <Widget>[
                        Flexible(
                          flex: 6,
                          child: Container(
                            height: height * .04,
                            child: Text(
                              'R\$ ${widget.valorTotal.toStringAsFixed(2)}',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Container(
                            height: height * .04,
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
                                      widget.tempo,
                                      widget.quantidade,
                                      widget.medida);
                                }),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Container(
                            height: height * .04,
                            child: IconButton(
                                icon: Icon(
                                  Icons.delete_forever,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  controller.listItens.remove(widget.itemModel);
                                }),
                          ),
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

  showAlertDialog1(
      controller,
      BuildContext context,
      String categoria,
      String descricao,
      double valor,
      String tempo,
      double quantidade,
      String medida) {
    controller.listItens.remove(widget.itemModel);
    String valorS = '$valor';
    String quantidadeS = '$quantidade';
    controller.categoriaController.text = categoria;
    controller.itemController.text = descricao;
    controller.valorController.text = valorS;
    controller.tempoController.text = tempo;
    controller.medidaController.text = medida;
    controller.quantidadeController.text = quantidadeS;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AddItem();
      },
    );
  }
}
