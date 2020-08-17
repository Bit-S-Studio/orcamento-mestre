import 'package:mobx/mobx.dart';

part 'perfil_controller.g.dart';

class PerfilController = _PerfilControllerBase with _$PerfilController;

abstract class _PerfilControllerBase with Store {
  @observable
  int currentIndex = 0;

  @observable
  String nomePage = 'Seus dados';

  @action
  void updateCurrentIndex(int index) => this.currentIndex = index;

  @action
  Future<String> getNomePage(int index) async {
    switch (index) {
      case 0:
        {
          nomePage = 'Seus dados';
        }
        break;
      case 1:
        {
          nomePage = 'Dados do cliente';
        }
        break;
      case 2:
        {
          nomePage = 'Projeto';
        }
        break;
      case 3:
        {
          nomePage = 'Layout';
        }
        break;
      case 4:
        {
          nomePage = 'Orçamento';
        }
        break;
    }
    return nomePage;
  }
}
