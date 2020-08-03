import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'layout_controller.dart';

class LayoutPage extends StatefulWidget {
  final String title;
  const LayoutPage({Key key, this.title = "Layout"}) : super(key: key);

  @override
  _LayoutPageState createState() => _LayoutPageState();
}

class _LayoutPageState extends ModularState<LayoutPage, LayoutController> {
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
