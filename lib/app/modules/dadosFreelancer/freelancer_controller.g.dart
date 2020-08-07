// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'freelancer_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FreelancerController on _FreelancerControllerBase, Store {
  final _$nomeControllerAtom =
      Atom(name: '_FreelancerControllerBase.nomeController');

  @override
  TextEditingController get nomeController {
    _$nomeControllerAtom.reportRead();
    return super.nomeController;
  }

  @override
  set nomeController(TextEditingController value) {
    _$nomeControllerAtom.reportWrite(value, super.nomeController, () {
      super.nomeController = value;
    });
  }

  @override
  String toString() {
    return '''
nomeController: ${nomeController}
    ''';
  }
}
