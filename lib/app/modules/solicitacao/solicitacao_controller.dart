import 'package:mobx/mobx.dart';

part 'solicitacao_controller.g.dart';

class SolicitacaoController = _SolicitacaoControllerBase
    with _$SolicitacaoController;

abstract class _SolicitacaoControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
