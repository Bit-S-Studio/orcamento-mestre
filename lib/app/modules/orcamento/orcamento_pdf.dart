import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class PdfOrcamento extends StatefulWidget {
  @override
  _PdfOrcamentoState createState() => _PdfOrcamentoState();
}

class _PdfOrcamentoState extends State<PdfOrcamento> {
  final pdf = pw.Document();
  writeOnPdf() {
    pdf.addPage(pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return <pw.Widget>[pw.Header()];
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: Container());
  }
}
