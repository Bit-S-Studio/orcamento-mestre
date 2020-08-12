// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pdf_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PdfController on _PdfControllerBase, Store {
  final _$pdfAtom = Atom(name: '_PdfControllerBase.pdf');

  @override
  pw.Document get pdf {
    _$pdfAtom.reportRead();
    return super.pdf;
  }

  @override
  set pdf(pw.Document value) {
    _$pdfAtom.reportWrite(value, super.pdf, () {
      super.pdf = value;
    });
  }

  final _$pdfNameAtom = Atom(name: '_PdfControllerBase.pdfName');

  @override
  String get pdfName {
    _$pdfNameAtom.reportRead();
    return super.pdfName;
  }

  @override
  set pdfName(String value) {
    _$pdfNameAtom.reportWrite(value, super.pdfName, () {
      super.pdfName = value;
    });
  }

  final _$savePdfAsyncAction = AsyncAction('_PdfControllerBase.savePdf');

  @override
  Future<dynamic> savePdf() {
    return _$savePdfAsyncAction.run(() => super.savePdf());
  }

  final _$_PdfControllerBaseActionController =
      ActionController(name: '_PdfControllerBase');

  @override
  dynamic writeOnPdf() {
    final _$actionInfo = _$_PdfControllerBaseActionController.startAction(
        name: '_PdfControllerBase.writeOnPdf');
    try {
      return super.writeOnPdf();
    } finally {
      _$_PdfControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pdf: ${pdf},
pdfName: ${pdfName}
    ''';
  }
}
