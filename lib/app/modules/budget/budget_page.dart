import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'budget_controller.dart';

class BudgetPage extends StatefulWidget {
  final String title;
  const BudgetPage({Key key, this.title = "Budget"}) : super(key: key);

  @override
  _BudgetPageState createState() => _BudgetPageState();
}

class _BudgetPageState extends ModularState<BudgetPage, BudgetController> {
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
