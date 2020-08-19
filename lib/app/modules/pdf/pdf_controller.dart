import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
part 'pdf_controller.g.dart';

class PdfController = _PdfControllerBase with _$PdfController;

abstract class _PdfControllerBase with Store {
  @observable
  var pdf = pw.Document();

  @observable
  String pdfName;

  @observable
  String fullPath;

  @action
  writeOnPdf(String color) {
    pdf.addPage(pw.MultiPage(
        pageTheme: pw.PageTheme(
          orientation: pw.PageOrientation.natural,
          clip: false,
          margin: pw.EdgeInsets.all(12),
          pageFormat: PdfPageFormat.a4,
          buildBackground: (context) => pw.Container(
              decoration: pw.BoxDecoration(
            color: PdfColor.fromHex(color),
          )),
        ),
        header: (pw.Context context) {
          return pw.Container(
              height: 100,
              width: double.infinity,
              decoration: pw.BoxDecoration(
                color: PdfColors.grey800,
              ),
              child: pw.Text('Logo'));
        },
        footer: (pw.Context context) {
          return pw.Container(
              height: 100,
              width: double.infinity,
              decoration: pw.BoxDecoration(
                color: PdfColors.grey800,
              ),
              child: pw.Text('infos'));
        },
        build: (pw.Context context) {
          return <pw.Widget>[
            pw.Paragraph(text: "Um texto"),
            pw.Paragraph(text: "Um texto"),
            pw.Paragraph(text: "Um texto"),
            pw.Paragraph(text: "Um texto"),
            pw.Paragraph(text: "Um texto"),
            pw.Paragraph(text: "Um texto"),
          ];
        }));
  }

  @action
  Future savePdf(String name) async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String documentPath = documentDirectory.path;
    File file = File("$documentPath/$name.pdf");
    file.writeAsBytesSync(pdf.save());
    viewPdf(name);
  }

  @action
  Future viewPdf(String name) async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String documentPath = documentDirectory.path;
    fullPath = "$documentPath/$name.pdf";
    Modular.to.pushNamed(
      '/pdf',
    );
  }
}
