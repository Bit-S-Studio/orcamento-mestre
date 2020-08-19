import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'layout_controller.g.dart';

class LayoutController = _LayoutControllerBase with _$LayoutController;

abstract class _LayoutControllerBase with Store {
  @observable
  Color pickerColor = Color(0xff443a49);

  @observable
  Color currentColor = Color(0xff443a49);

  @action
  void changeColor(Color color) => pickerColor = color;
}
