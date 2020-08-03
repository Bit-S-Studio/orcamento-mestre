import 'package:mobx/mobx.dart';

part 'empresa_controller.g.dart';

class EmpresaController = _EmpresaControllerBase with _$EmpresaController;

abstract class _EmpresaControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
