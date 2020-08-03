import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'empresa_controller.dart';

class DadosEmpresaPage extends StatefulWidget {
  final String title;
  const DadosEmpresaPage({Key key, this.title = "DadosEmpresa"})
      : super(key: key);

  @override
  _DadosEmpresaPageState createState() => _DadosEmpresaPageState();
}

class _DadosEmpresaPageState
    extends ModularState<DadosEmpresaPage, EmpresaController> {
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
