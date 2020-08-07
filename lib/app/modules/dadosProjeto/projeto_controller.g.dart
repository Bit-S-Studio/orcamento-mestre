// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'projeto_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProjetoController on _ProjetoControllerBase, Store {
  final _$categoriaControllerAtom =
      Atom(name: '_ProjetoControllerBase.categoriaController');

  @override
  TextEditingController get categoriaController {
    _$categoriaControllerAtom.reportRead();
    return super.categoriaController;
  }

  @override
  set categoriaController(TextEditingController value) {
    _$categoriaControllerAtom.reportWrite(value, super.categoriaController, () {
      super.categoriaController = value;
    });
  }

  final _$itemControllerAtom =
      Atom(name: '_ProjetoControllerBase.itemController');

  @override
  TextEditingController get itemController {
    _$itemControllerAtom.reportRead();
    return super.itemController;
  }

  @override
  set itemController(TextEditingController value) {
    _$itemControllerAtom.reportWrite(value, super.itemController, () {
      super.itemController = value;
    });
  }

  final _$valorControllerAtom =
      Atom(name: '_ProjetoControllerBase.valorController');

  @override
  TextEditingController get valorController {
    _$valorControllerAtom.reportRead();
    return super.valorController;
  }

  @override
  set valorController(TextEditingController value) {
    _$valorControllerAtom.reportWrite(value, super.valorController, () {
      super.valorController = value;
    });
  }

  final _$tempoControllerAtom =
      Atom(name: '_ProjetoControllerBase.tempoController');

  @override
  TextEditingController get tempoController {
    _$tempoControllerAtom.reportRead();
    return super.tempoController;
  }

  @override
  set tempoController(TextEditingController value) {
    _$tempoControllerAtom.reportWrite(value, super.tempoController, () {
      super.tempoController = value;
    });
  }

  @override
  String toString() {
    return '''
categoriaController: ${categoriaController},
itemController: ${itemController},
valorController: ${valorController},
tempoController: ${tempoController}
    ''';
  }
}
