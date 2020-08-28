import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    ScreenUtil.getInstance()..init(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.height;
    final controller = Provider.of<ProjetoController>(context);
    return Container(
        height: (widget.tempo == '' &&
                widget.quantidade == 0 &&
                widget.medida == '')
            ? height * 0.12
            : height * 0.175,
        width: width,
        margin: EdgeInsets.only(
            top: height * .005, left: width * .005, right: width * .005),
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
          width: width * 0.9,
          padding: EdgeInsets.all(12.0),
          child: Column(
            children: [
              Flexible(
                flex: 1,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: height * .036,
                      width: width * .3,
                      margin: EdgeInsets.only(
                        top: height * .005,
                        bottom: height * .005,
                      ),
                      child: Text(
                        widget.descricao,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: ScreenUtil.instance.setSp(35),
                        ),
                        maxLines: 1,
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      height: height * .03,
                      width: width * .001,
                    ),
                    Container(
                        height: height * .03,
                        margin: EdgeInsets.only(
                            top: height * .005,
                            bottom: height * .005,
                            left: width * .012),
                        child: Text(
                          'R\$ ${widget.valor.toStringAsFixed(2)}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: ScreenUtil.instance.setSp(35),
                          ),
                          maxLines: 1,
                        )),
                  ],
                ),
              ),
              (widget.tempo == '' &&
                      widget.quantidade == 0 &&
                      widget.medida == '')
                  ? Container()
                  : Container(
                      color: Colors.white,
                      height: height * .001,
                      width: width,
                    ),
              (widget.tempo == '' &&
                      widget.quantidade == 0 &&
                      widget.medida == '')
                  ? Container()
                  : Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        (widget.quantidade != 0)
                            ? Container(
                                height: height * .036,
                                margin: EdgeInsets.only(
                                    top: height * .005,
                                    bottom: height * .005,
                                    right: width * .005),
                                child: Text(
                                  'Quantidade:',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: ScreenUtil.instance.setSp(35),
                                  ),
                                  maxLines: 1,
                                ),
                              )
                            : Container(),
                        (widget.quantidade != 0)
                            ? Container(
                                height: height * .03,
                                width: width * .045,
                                margin: EdgeInsets.only(
                                    top: height * .005,
                                    bottom: height * .005,
                                    right: width * .005),
                                child: Text(
                                  '${widget.quantidade}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: ScreenUtil.instance.setSp(35),
                                  ),
                                  maxLines: 1,
                                ),
                              )
                            : Container(),
                        (widget.quantidade != 0)
                            ? Container(
                                color: Colors.white,
                                height: height * .03,
                                width: width * .001,
                              )
                            : Container(),
                        (widget.medida != '')
                            ? Container(
                                height: height * .03,
                                margin: EdgeInsets.only(
                                    top: height * .005,
                                    bottom: height * .005,
                                    right: width * .005,
                                    left: width * .005),
                                child: Text(
                                  'Medida:',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: ScreenUtil.instance.setSp(35),
                                  ),
                                  maxLines: 1,
                                ),
                              )
                            : Container(),
                        (widget.medida != '')
                            ? Container(
                                height: height * .03,
                                width: width * .08,
                                margin: EdgeInsets.only(
                                    top: height * .005,
                                    bottom: height * .005,
                                    right: width * .005),
                                child: Text(
                                  '${widget.medida}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: ScreenUtil.instance.setSp(35),
                                  ),
                                  maxLines: 1,
                                ),
                              )
                            : Container(),
                        (widget.medida != '')
                            ? Container(
                                color: Colors.white,
                                height: height * .03,
                                width: width * .001,
                              )
                            : Container(),
                        (widget.tempo != '')
                            ? Container(
                                margin: EdgeInsets.only(
                                  top: height * .005,
                                  bottom: height * .005,
                                  left: width * .005,
                                  right: width * .005,
                                ),
                                child: Icon(
                                  Icons.timer,
                                  color: Colors.white,
                                  size: 16,
                                ),
                              )
                            : Container(),
                        (widget.tempo != '')
                            ? Container(
                                margin: EdgeInsets.only(
                                  top: height * .005,
                                  bottom: height * .005,
                                ),
                                child: Text(
                                  widget.tempo,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: ScreenUtil.instance.setSp(35),
                                  ),
                                  maxLines: 1,
                                ),
                              )
                            : Container()
                      ],
                    ),
              Container(
                color: Colors.white,
                height: height * .001,
                width: width,
              ),
              Flexible(
                flex: 1,
                child: Container(
                  height: height * .042,
                  width: width,
                  margin: EdgeInsets.only(top: height * .001),
                  child: Row(
                    children: <Widget>[
                      Container(
                        height: height * .045,
                        margin: EdgeInsets.only(
                            top: height * .01,
                            bottom: height * .005,
                            right: width * .005,
                            left: width * .005),
                        padding: EdgeInsets.only(
                          top: height * .005,
                        ),
                        child: Text(
                          'Total:',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: ScreenUtil.instance.setSp(35),
                          ),
                          maxLines: 1,
                        ),
                      ),
                      Container(
                        height: height * .045,
                        width: width * .18,
                        margin: EdgeInsets.only(
                          top: height * .01,
                          bottom: height * .005,
                        ),
                        padding: EdgeInsets.only(
                          top: height * .005,
                        ),
                        child: Text(
                          'R\$ ${widget.valorTotal.toStringAsFixed(2)}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: ScreenUtil.instance.setSp(35),
                          ),
                          maxLines: 1,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: width * .008),
                        child: Row(
                          children: [
                            Container(
                              height: height * .05,
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
                            Container(
                              height: height * .05,
                              child: IconButton(
                                  icon: Icon(
                                    Icons.delete_forever,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    controller.listItens
                                        .remove(widget.itemModel);
                                  }),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
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
