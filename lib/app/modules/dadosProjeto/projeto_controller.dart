import 'package:flutter/cupertino.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
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
  TextEditingController quantidadeController = TextEditingController();

  @observable
  TextEditingController volumeController = TextEditingController();

  @observable
  TextEditingController medidaController = TextEditingController();

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
  String tempo;

  @observable
  double quantidade;

  @observable
  String volume;

  @observable
  String medida;

  @observable
  double valorTotal = 0.00;

  @action
  Future<double> setValor(String newValor) async {
    String newValor2 = newValor.replaceAll('.', '');
    valor = double.parse(newValor2.replaceAll(',', '.'));
    if (quantidade == 0) {
      valorTotal = valor;
    } else {
      valorTotal = quantidade * valor;
    }
    return valor;
  }

  @action
  changeTempo(String newTempo) => tempo = newTempo;

  @action
  changeCategoria(String newCategoria) => categoria = newCategoria;

  @action
  changeDescricao(String newDescricao) => descricao = newDescricao;

  @action
  Future<double> setQuantidade(String newQuantidade) async {
    quantidade = double.parse(newQuantidade);
    return valor;
  }

  @action
  changeVolume(String newVolume) => volume = newVolume;

  @action
  changeMedida(String newMedida) => medida = newMedida;

  @action
  Future<dynamic> setItem() async {
    if (tempo == null) {
      tempo = '';
    }
    if (medida == null) {
      medida = '';
    }
    listItens.add(ItemModel(
        categoria: categoria,
        descricao: descricao,
        valor: valor,
        tempo: tempo,
        quantidade: quantidade,
        medida: medida,
        valorTotal: valorTotal));
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
