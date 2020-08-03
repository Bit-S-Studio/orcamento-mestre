import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'orcamento_controller.dart';

class OrcamentoPage extends StatefulWidget {
  final String title;
  const OrcamentoPage({Key key, this.title = "Orcamento"}) : super(key: key);

  @override
  _OrcamentoPageState createState() => _OrcamentoPageState();
}

class _OrcamentoPageState
    extends ModularState<OrcamentoPage, OrcamentoController> {
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
