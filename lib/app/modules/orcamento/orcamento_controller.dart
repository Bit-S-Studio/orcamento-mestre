import 'package:mobx/mobx.dart';

part 'orcamento_controller.g.dart';

class OrcamentoController = _OrcamentoControllerBase with _$OrcamentoController;

abstract class _OrcamentoControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
