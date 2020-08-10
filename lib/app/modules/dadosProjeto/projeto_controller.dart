import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:orcamento_mestre/app/modules/dadosProjeto/itemModel.dart';
import 'package:orcamento_mestre/app/modules/dadosProjeto/projetoModel.dart';

part 'projeto_controller.g.dart';

class ProjetoController = _ProjetoControllerBase with _$ProjetoController;

abstract class _ProjetoControllerBase with Store {
  @observable
  TextEditingController categoriaController = TextEditingController();

  @observable
  TextEditingController itemController = TextEditingController();

  @observable
  TextEditingController valorController = TextEditingController();

  @observable
  TextEditingController tempoController = TextEditingController();

  @observable
  int indexCategoria = 0;

  @observable
  int indexItem = 1;

  @observable
  double itemHeight = 1;

  @observable
  ObservableList<ItemModel> listItens = ObservableList<ItemModel>();
}
