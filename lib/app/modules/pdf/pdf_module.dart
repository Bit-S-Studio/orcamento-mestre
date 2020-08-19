import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';
import 'package:orcamento_mestre/app/modules/pdf/pdf_controller.dart';
import 'package:orcamento_mestre/app/modules/pdf/pdf_page.dart';
import 'package:pdf/pdf.dart';

class PdfModule extends WidgetModule {
  @override
  List<Bind> get binds => [Bind((i) => PdfController())];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => PagePDF()),
        Router('/', child: (_, args) => PagePDF()),
      ];

  static Inject get to => Inject<PdfModule>.of();

  @override
  Widget get view => PagePDF();
}
