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
        height: height * 0.08,
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
        child: ListTile(
          title: Text(
            widget.descricao,
            style: TextStyle(fontSize: 20),
          ),
          subtitle: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(Icons.money_off),
              Text('${widget.valor}'),
              Flexible(fit: FlexFit.tight, child: SizedBox()),
              Icon(Icons.timer),
              Text(format),
            ],
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    showAlertDialog1(controller, context, widget.categoria,
                        widget.descricao, widget.valor, widget.tempo);
                  }),
              IconButton(
                  icon: Icon(Icons.delete_forever),
                  onPressed: () {
                    controller.listItens.remove(widget.itemModel);
                  }),
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
