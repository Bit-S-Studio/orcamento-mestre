import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'freelancer_controller.g.dart';

class FreelancerController = _FreelancerControllerBase
    with _$FreelancerController;

abstract class _FreelancerControllerBase with Store {
  @observable
  TextEditingController nomeController = TextEditingController();
}
