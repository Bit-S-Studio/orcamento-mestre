import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:orcamento_mestre/app/modules/dadosProjeto/category_item_widget.dart';
import 'package:orcamento_mestre/app/modules/orcamento/orcamento_controller.dart';
import 'package:provider/provider.dart';
import 'projeto_controller.dart';

class DadosProjetoPage extends StatefulWidget {
  final String title;
  const DadosProjetoPage({Key key, this.title = "DadosProjeto"})
      : super(key: key);

  @override
  _DadosProjetoPageState createState() => _DadosProjetoPageState();
}

class _DadosProjetoPageState
    extends ModularState<DadosProjetoPage, ProjetoController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.height;
    final oController = Provider.of<OrcamentoController>(context);
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                height: height * .06,
                width: width,
                margin:
                    EdgeInsets.only(top: height * .025, bottom: height * .015),
                child: Center(
                    child: Text(
                  'Adicione ou remova ítens do seu orçamento',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                )),
              ),
              categoriaAdd(),
              SizedBox(
                height: 12,
              ),
              Observer(builder: (_) {
                return Container(
                  height: height * 0.8,
                  width: width,
                  child: ListView.builder(
                    itemCount: controller.indexCategoria,
                    itemBuilder: (context, index) {
                      return CategoryItemWidget();
                    },
                  ),
                );
              })
            ],
          ),
        ),
      ),
    );
  }

  Widget categoriaAdd() {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Container(
          color: Colors.blue[900],
          height: height * .08,
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
                    top: height * .01, left: width * .015, right: width * .015),
                child: Text(
                  'Orçamento',
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
                        controller.indexCategoria =
                            controller.indexCategoria + 1;
                      });
                }),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
