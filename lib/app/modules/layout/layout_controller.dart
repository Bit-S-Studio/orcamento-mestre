import 'package:mobx/mobx.dart';

part 'layout_controller.g.dart';

class LayoutController = _LayoutControllerBase with _$LayoutController;

abstract class _LayoutControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
