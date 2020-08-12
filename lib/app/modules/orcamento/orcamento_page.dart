import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:orcamento_mestre/app/modules/pdf/pdf_controller.dart';
import 'package:provider/provider.dart';
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
    final pdfController = Provider.of<PdfController>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          children: [
            Center(
              child: FloatingActionButton(
                  onPressed: () async {
                    pdfController.writeOnPdf();
                    await pdfController.savePdf();
                    await pdfController.viewPdf('name');
                  },
                  child: Text('Finalizar Orçamento')),
            )
          ],
        ));
  }
}
