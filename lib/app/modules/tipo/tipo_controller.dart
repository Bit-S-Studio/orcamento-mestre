import 'package:mobx/mobx.dart';

part 'tipo_controller.g.dart';

class TipoController = _TipoControllerBase with _$TipoController;

abstract class _TipoControllerBase with Store {
  @observable
  List<String> listTipos = <String>[
    'Desenvolvedor Mobile',
    'Web Designer',
    'Interior Designer',
    'Digital Illustrator'
  ];

  @action
  void increment() {}
}
