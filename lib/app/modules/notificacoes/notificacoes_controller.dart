import 'package:mobx/mobx.dart';

part 'notificacoes_controller.g.dart';

class NotificacoesController = _NotificacoesControllerBase
    with _$NotificacoesController;

abstract class _NotificacoesControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
