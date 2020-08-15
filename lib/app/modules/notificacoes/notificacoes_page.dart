import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'notificacoes_controller.dart';

class NotificacoesPage extends StatefulWidget {
  final String title;
  const NotificacoesPage({Key key, this.title = "Notificacoes"})
      : super(key: key);

  @override
  _NotificacoesPageState createState() => _NotificacoesPageState();
}

class _NotificacoesPageState
    extends ModularState<NotificacoesPage, NotificacoesController> {
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
