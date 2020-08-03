import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:orcamento_mestre/app/modules/orcamento/orcamento_modal.dart';

part 'orcamento_controller.g.dart';

class OrcamentoController = _OrcamentoControllerBase with _$OrcamentoController;

abstract class _OrcamentoControllerBase with Store {
  @observable
  String tipo;

  @observable
  PickedFile logo;

  @observable
  String nomeEmpresa;

  @observable
  String email;

  @observable
  String telefone;

  @observable
  String texto;

  @observable
  List<OrcamentoModal> listOrcamento = [];

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
}
