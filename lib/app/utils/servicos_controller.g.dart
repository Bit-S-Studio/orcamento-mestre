// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'servicos_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ServicosController on _ServicosControllerBase, Store {
  final _$listServicosAtom = Atom(name: '_ServicosControllerBase.listServicos');

  @override
  ObservableList<String> get listServicos {
    _$listServicosAtom.reportRead();
    return super.listServicos;
  }

  @override
  set listServicos(ObservableList<String> value) {
    _$listServicosAtom.reportWrite(value, super.listServicos, () {
      super.listServicos = value;
    });
  }

  final _$listServicosEAtom =
      Atom(name: '_ServicosControllerBase.listServicosE');

  @override
  ObservableList<String> get listServicosE {
    _$listServicosEAtom.reportRead();
    return super.listServicosE;
  }

  @override
  set listServicosE(ObservableList<String> value) {
    _$listServicosEAtom.reportWrite(value, super.listServicosE, () {
      super.listServicosE = value;
    });
  }

  final _$getServicosAsyncAction =
      AsyncAction('_ServicosControllerBase.getServicos');

  @override
  Future<dynamic> getServicos() {
    return _$getServicosAsyncAction.run(() => super.getServicos());
  }

  final _$getSuggestionsAsyncAction =
      AsyncAction('_ServicosControllerBase.getSuggestions');

  @override
  Future<List<dynamic>> getSuggestions(String query) {
    return _$getSuggestionsAsyncAction.run(() => super.getSuggestions(query));
  }

  @override
  String toString() {
    return '''
listServicos: ${listServicos},
listServicosE: ${listServicosE}
    ''';
  }
}
