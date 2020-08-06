import 'package:flutter/material.dart';

import 'category_item_widget.dart';
import 'item_description_widget.dart';

class ScreenOrcamentoPage extends StatefulWidget {
  final String title;

  const ScreenOrcamentoPage({Key key, this.title = "Dados Orçamento"})
      : super(key: key);

  @override
  _ScreenOrcamentoPageState createState() => _ScreenOrcamentoPageState();
}

class _ScreenOrcamentoPageState extends State<ScreenOrcamentoPage> {
  final _itemController = TextEditingController();
  final _valorController = TextEditingController();

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
