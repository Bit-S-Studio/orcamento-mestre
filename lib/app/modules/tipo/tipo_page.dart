import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'tipo_controller.dart';

class TipoPage extends StatefulWidget {
  final String title;
  const TipoPage({Key key, this.title = "Tipo"}) : super(key: key);

  @override
  _TipoPageState createState() => _TipoPageState();
}

class _TipoPageState extends ModularState<TipoPage, TipoController> {
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
