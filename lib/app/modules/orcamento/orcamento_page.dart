import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:orcamento_mestre/app/modules/orcamento/orcamento_pdf.dart';
import 'package:orcamento_mestre/app/modules/orcamento/view_pdf_page.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'orcamento_controller.dart';
import 'package:pdf/widgets.dart' as pw;

class OrcamentoPage extends StatefulWidget {
  final String title;
  const OrcamentoPage({Key key, this.title = "Orcamento"}) : super(key: key);

  @override
  _OrcamentoPageState createState() => _OrcamentoPageState();
}

class _OrcamentoPageState
    extends ModularState<OrcamentoPage, OrcamentoController> {
  //use 'controller' variable to access controller
  PdfOrcamento pdfOrcamento = PdfOrcamento();
  final pdf = pw.Document();
  writeOnPdf() {
    pdf.addPage(pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: pw.EdgeInsets.all(32),
        build: (pw.Context context) {
          return <pw.Widget>[
            pw.Header(level: 0, child: pw.Text("Easy Approach Document")),
            pw.Paragraph(text: "Um texto")
          ];
        }));
  }

  Future savePdf() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String documentPath = documentDirectory.path;
    File file = File("$documentPath/example.pdf");
    file.writeAsBytesSync(pdf.save());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          children: [
            Center(
              child: FloatingActionButton(
                  onPressed: () async {
                    writeOnPdf();
                    await savePdf();

                    Directory documentDirectory =
                        await getApplicationDocumentsDirectory();

                    String documentPath = documentDirectory.path;

                    String fullPath = "$documentPath/example.pdf";

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ViewPdfPage(
                                  path: fullPath,
                                )));
                  },
                  child: Text('Finalizar Orçamento')),
            )
          ],
        ));
  }
}
