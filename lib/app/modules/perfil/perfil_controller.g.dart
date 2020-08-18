// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'perfil_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PerfilController on _PerfilControllerBase, Store {
  final _$currentIndexAtom = Atom(name: '_PerfilControllerBase.currentIndex');

  @override
  int get currentIndex {
    _$currentIndexAtom.reportRead();
    return super.currentIndex;
  }

  @override
  set currentIndex(int value) {
    _$currentIndexAtom.reportWrite(value, super.currentIndex, () {
      super.currentIndex = value;
    });
  }

  final _$nomePageAtom = Atom(name: '_PerfilControllerBase.nomePage');

  @override
  String get nomePage {
    _$nomePageAtom.reportRead();
    return super.nomePage;
  }

  @override
  set nomePage(String value) {
    _$nomePageAtom.reportWrite(value, super.nomePage, () {
      super.nomePage = value;
    });
  }

  final _$getNomePageAsyncAction =
      AsyncAction('_PerfilControllerBase.getNomePage');

  @override
  Future<String> getNomePage(int index) {
    return _$getNomePageAsyncAction.run(() => super.getNomePage(index));
  }

  final _$_PerfilControllerBaseActionController =
      ActionController(name: '_PerfilControllerBase');

  @override
  void updateCurrentIndex(int index) {
    final _$actionInfo = _$_PerfilControllerBaseActionController.startAction(
        name: '_PerfilControllerBase.updateCurrentIndex');
    try {
      return super.updateCurrentIndex(index);
    } finally {
      _$_PerfilControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentIndex: ${currentIndex},
nomePage: ${nomePage}
    ''';
  }
}
