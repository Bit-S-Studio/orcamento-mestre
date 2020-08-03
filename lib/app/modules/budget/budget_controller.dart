import 'package:mobx/mobx.dart';

part 'budget_controller.g.dart';

class BudgetController = _BudgetControllerBase with _$BudgetController;

abstract class _BudgetControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
