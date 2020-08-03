import 'package:mobx/mobx.dart';

part 'projeto_controller.g.dart';

class ProjetoController = _ProjetoControllerBase with _$ProjetoController;

abstract class _ProjetoControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
