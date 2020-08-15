import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'solicitacao_controller.dart';

class SolicitacaoPage extends StatefulWidget {
  final String title;
  const SolicitacaoPage({Key key, this.title = "Solicitacao"})
      : super(key: key);

  @override
  _SolicitacaoPageState createState() => _SolicitacaoPageState();
}

class _SolicitacaoPageState
    extends ModularState<SolicitacaoPage, SolicitacaoController> {
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
