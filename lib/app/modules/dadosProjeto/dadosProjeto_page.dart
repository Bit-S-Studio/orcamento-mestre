import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grouped_listview/grouped_listview.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:mobx/mobx.dart';
import 'package:orcamento_mestre/app/modules/dadosProjeto/addItem.dart';
import 'package:orcamento_mestre/app/modules/dadosProjeto/itemModel.dart';
import 'package:orcamento_mestre/app/modules/dadosProjeto/item_list.dart';
import 'package:orcamento_mestre/app/modules/orcamento/orcamento_controller.dart';
import 'package:provider/provider.dart';
import 'projeto_controller.dart';

class DadosProjetoPage extends StatefulWidget {
  final String title;
  const DadosProjetoPage({Key key, this.title = "Projeto"}) : super(key: key);

  @override
  _DadosProjetoPageState createState() => _DadosProjetoPageState();
}

class _DadosProjetoPageState extends State<DadosProjetoPage> {
  //use 'controller' variable to access controller
  ObservableList<int> listItens = ObservableList<int>();
  @override
  Widget build(BuildContext context) {
    ScreenUtil.getInstance()..init(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.height;
    final controller = Provider.of<ProjetoController>(context);
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Observer(builder: (_) {
          return (controller.listItens.length == 0)
              ? Center(
                  child: Text(
                    'Adicione itens ao seu projeto',
                    style: TextStyle(
                      fontSize: ScreenUtil.instance.setSp(45),
                    ),
                  ),
                )
              : item();
        }));
  }

  Widget item() {
    ScreenUtil.getInstance()..init(context);
    final controller = Provider.of<ProjetoController>(context);
    return GroupedListView<ItemModel, String>(
      collection: controller.listItens,
      groupBy: (ItemModel g) => g.categoria,
      groupBuilder: (BuildContext context, String name) => Container(
        height: MediaQuery.of(context).size.height * 0.06,
        child: Container(
            height: MediaQuery.of(context).size.height * .01,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * .015,
                left: MediaQuery.of(context).size.width * .025),
            child: Text(name,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: ScreenUtil.instance.setSp(65),
                ),
              maxLines: 1,
            )),
      ),
      listBuilder: (BuildContext context, ItemModel g) => ItemList(
        itemModel: g,
        descricao: g.descricao,
        categoria: g.categoria,
        valor: g.valor,
        tempo: g.tempo,
        quantidade: g.quantidade,
        medida: g.medida,
        valorTotal: g.valorTotal,
      ),
    );
  }
}
