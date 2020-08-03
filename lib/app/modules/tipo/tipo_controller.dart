import 'package:mobx/mobx.dart';

part 'tipo_controller.g.dart';

class TipoController = _TipoControllerBase with _$TipoController;

abstract class _TipoControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
