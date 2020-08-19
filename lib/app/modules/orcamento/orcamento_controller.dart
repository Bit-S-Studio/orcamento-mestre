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
  String cabecalio;

  @observable
  String rodape;

  @observable
  String base;

  @observable
  String colorLetraCabecalio;

  @observable
  String colorLetraRodape;

  @observable
  String colorLetraBase;

  @observable
  bool letraPreta = true;

  @observable
  bool letraBranca = false;

  @observable
  String corLetra = 'Preta';
  @action
  Future<String> convertColor(Color color, String nome, String letra) async {
    String colorString = color.toString(); // Color(0x12345678)
    String valueString =
        colorString.split('(0x')[1].split(')')[0]; // kind of hacky..
    String colorHex = valueString.toString();
    String colorLetra;
    if (letra == 'Preta') {
      colorLetra = '000000';
    } else {
      colorLetra = 'FFFFFF';
    }
    if (nome == 'cabecalio') {
      cabecalio = colorHex;
      colorLetraCabecalio = colorLetra;
      print('cabecalio');
      print(cabecalio);
      print(colorLetraCabecalio);
    } else if (nome == 'rodape') {
      rodape = colorHex;
      colorLetraRodape = colorLetra;
      print('rodape');
      print(rodape);
      print(colorLetraRodape);
    } else {
      base = colorHex;
      colorLetraBase = colorLetra;
      print('base');
      print(base);
      print(colorLetraBase);
    }
    return colorHex;
  }

  @observable
  String nome;

  @observable
  TextEditingController nomeController = TextEditingController();

  @observable
  String observacao;

  @observable
  TextEditingController observacaoController = TextEditingController();

  @observable
  List<String> categoriasProjeto = [];
}

class ItensModel {}
