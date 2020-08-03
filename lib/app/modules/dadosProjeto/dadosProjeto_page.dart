import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
