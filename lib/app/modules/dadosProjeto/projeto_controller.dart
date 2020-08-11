import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:orcamento_mestre/app/modules/dadosProjeto/itemModel.dart';

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

  @observable
  double valor;

  @observable
  String categoria;

  @observable
  String descricao;

  @observable
  DateTime tempo;

  @action
  Future<double> setValor(String newValor) async {
    valor = double.parse(newValor);
    return valor;
  }

  @action
  changeTempo(DateTime newTempo) => tempo = newTempo;

  @action
  changeCategoria(String newCategoria) => categoria = newCategoria;

  @action
  changeDescricao(String newDescricao) => descricao = newDescricao;

  @action
  Future<dynamic> setItem() async {
    listItens.add(ItemModel(
        categoria: categoria,
        descricao: descricao,
        valor: valor,
        tempo: tempo));
    return listItens;
  }

  @action
  Future<ObservableList<ItemModel>> getItens(String query) async {
    ObservableList<ItemModel> itensList = List();
    itensList.clear();
    itensList.addAll(listItens);
    itensList.retainWhere((s) => s.categoria.contains(query));
    return itensList;
  }
}
