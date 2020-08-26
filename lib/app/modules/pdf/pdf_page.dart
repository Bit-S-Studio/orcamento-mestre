import 'package:flutter/material.dart';
import 'package:flutter_full_pdf_viewer/flutter_full_pdf_viewer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:orcamento_mestre/app/modules/pdf/pdf_controller.dart';
import 'package:provider/provider.dart';

class PagePDF extends StatefulWidget {
  @override
  _PagePDFState createState() => _PagePDFState();
}

class _PagePDFState extends State<PagePDF> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.getInstance()..init(context);
    final pdfController = Provider.of<PdfController>(context);
    return PDFViewerScaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: Text("Seu Orçamento está pronto!",
            style: TextStyle(
              fontSize: ScreenUtil.instance.setSp(50),
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.share),
              onPressed: () {},
            ),
          ],
        ),
        path: pdfController.fullPath);
  }
}
