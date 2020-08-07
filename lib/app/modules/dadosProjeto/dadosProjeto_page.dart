import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:orcamento_mestre/app/modules/dadosProjeto/category_item_widget.dart';
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
              CategoryItemWidget()
            ],
          ),
        ),
      ),
    );
  }
}
