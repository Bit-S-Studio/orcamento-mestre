// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'layout_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LayoutController on _LayoutControllerBase, Store {
  final _$pickerColorAtom = Atom(name: '_LayoutControllerBase.pickerColor');

  @override
  Color get pickerColor {
    _$pickerColorAtom.reportRead();
    return super.pickerColor;
  }

  @override
  set pickerColor(Color value) {
    _$pickerColorAtom.reportWrite(value, super.pickerColor, () {
      super.pickerColor = value;
    });
  }

  final _$currentColorAtom = Atom(name: '_LayoutControllerBase.currentColor');

  @override
  Color get currentColor {
    _$currentColorAtom.reportRead();
    return super.currentColor;
  }

  @override
  set currentColor(Color value) {
    _$currentColorAtom.reportWrite(value, super.currentColor, () {
      super.currentColor = value;
    });
  }

  final _$_LayoutControllerBaseActionController =
      ActionController(name: '_LayoutControllerBase');

  @override
  void changeColor(Color color) {
    final _$actionInfo = _$_LayoutControllerBaseActionController.startAction(
        name: '_LayoutControllerBase.changeColor');
    try {
      return super.changeColor(color);
    } finally {
      _$_LayoutControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pickerColor: ${pickerColor},
currentColor: ${currentColor}
    ''';
  }
}
