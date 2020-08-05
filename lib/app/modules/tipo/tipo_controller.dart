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

  @observable
  List<String> listTipos2 = <String>[
    'Empresa',
    'Freelancer',
  ];

  @observable
  String dropdownValue = 'Empresa';

  @action
  void increment() {}
}
