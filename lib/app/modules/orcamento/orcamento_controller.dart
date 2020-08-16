import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:orcamento_mestre/app/modules/dadosProjeto/itemModel.dart';

part 'orcamento_controller.g.dart';

class OrcamentoController = _OrcamentoControllerBase with _$OrcamentoController;

abstract class _OrcamentoControllerBase with Store {
  @observable
  String texto;

  @observable
  List<ItemModel> listItens = [];

  @observable
  double valorTotal;

  @observable
  Colors colorCabecalio;

  @observable
  Colors colorRodape;

  @observable
  Colors colorBase;

  @observable
  Colors colorLetra;

  @observable
  String nomeProjeto;

  @observable
  List<String> categoriasProjeto = [];
}

class ItensModel {}
