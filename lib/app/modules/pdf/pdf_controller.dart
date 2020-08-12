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

  @action
  Future savePdf() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String documentPath = documentDirectory.path;
    File file = File("$documentPath/$pdfName.pdf");
    file.writeAsBytesSync(pdf.save());
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
