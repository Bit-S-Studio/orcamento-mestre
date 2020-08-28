import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:network_image_to_byte/network_image_to_byte.dart';
import 'dart:typed_data';
part 'pdf_controller.g.dart';

class PdfController = _PdfControllerBase with _$PdfController;

abstract class _PdfControllerBase with Store {
  @observable
  var pdf = pw.Document();

  @observable
  String pdfName;

  @observable
  String fullPath;

  @observable
  PdfImage image;

  @action
  Future<Uint8List> logoConverter(String logo) async {
    Uint8List byteImage = await networkImageToByte(logo);
    return byteImage;
  }

  @action
  writeOnPdf(
      {String colorBase,
      String colorCabecalio,
      String colorRodape,
      String colorLetraCabecalio,
      String colorLetraBase,
      String colorLetraRodape,
      String logo,
      String nomeEmpresa,
      String nomeCliente,
      String emailEmpresa,
      String telefoneEmpresa,
      String enderecoEmpresa,
      String numeroEmpresa,
      String cidadeEmpresa,
      String ufEmpresa}) async {
    if (logo == '') {
      print(image);
    } else {
      final logoN = await logoConverter(logo);
      image = PdfImage.file(
        pdf.document,
        bytes: logoN,
      );
      print(image);
    }
    pdf.addPage(pw.MultiPage(
        pageTheme: pw.PageTheme(
          orientation: pw.PageOrientation.natural,
          clip: false,
          margin: pw.EdgeInsets.all(12),
          pageFormat: PdfPageFormat.a4,
          buildBackground: (context) => pw.Container(
              decoration: pw.BoxDecoration(
            color: PdfColor.fromHex(colorBase),
          )),
        ),
        header: (pw.Context context) {
          return pw.Container(
              height: 100,
              width: double.infinity,
              decoration: pw.BoxDecoration(
                color: PdfColor.fromHex(colorCabecalio),
              ),
              child: pw.Row(children: <pw.Widget>[
                (image != null) ? pw.Image(image) : pw.Container(),
                pw.Column(children: <pw.Widget>[
                  pw.Text('Orçamento de $nomeEmpresa para $nomeCliente',
                      textAlign: pw.TextAlign.center),
                  pw.Align(
                    alignment: pw.Alignment.bottomRight,
                    child: pw.Text('Data ${DateTime.now()}',
                        textAlign: pw.TextAlign.center),
                  )
                ])
              ]));
        },
        footer: (pw.Context context) {
          return pw.Container(
              height: 100,
              width: double.infinity,
              decoration: pw.BoxDecoration(
                color: PdfColor.fromHex(colorRodape),
              ),
              child: pw.Center(
                  child: pw.Column(children: <pw.Widget>[
                pw.Text(nomeEmpresa, textAlign: pw.TextAlign.center),
                pw.Text(emailEmpresa, textAlign: pw.TextAlign.center),
                pw.Text(telefoneEmpresa, textAlign: pw.TextAlign.center),
                pw.Text(
                    '$enderecoEmpresa $numeroEmpresa, $cidadeEmpresa - $ufEmpresa',
                    textAlign: pw.TextAlign.center),
              ])));
        },
        build: (pw.Context context) {
          return <pw.Widget>[
            pw.Paragraph(
                text: "Um texto",
                style: pw.TextStyle(color: PdfColor.fromHex(colorLetraBase))),
            pw.Paragraph(
                text: "Um texto",
                style: pw.TextStyle(color: PdfColor.fromHex(colorLetraBase))),
            pw.Paragraph(
                text: "Um texto",
                style: pw.TextStyle(color: PdfColor.fromHex(colorLetraBase))),
            pw.Paragraph(
                text: "Um texto",
                style: pw.TextStyle(color: PdfColor.fromHex(colorLetraBase))),
            pw.Paragraph(
                text: "Um texto",
                style: pw.TextStyle(color: PdfColor.fromHex(colorLetraBase))),
            pw.Paragraph(
                text: "Um texto",
                style: pw.TextStyle(color: PdfColor.fromHex(colorLetraBase))),
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
