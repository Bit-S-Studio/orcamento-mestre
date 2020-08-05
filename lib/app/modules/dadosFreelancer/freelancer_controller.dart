import 'package:mobx/mobx.dart';

part 'freelancer_controller.g.dart';

class FreelancerController = _FreelancerControllerBase
    with _$FreelancerController;

abstract class _FreelancerControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
