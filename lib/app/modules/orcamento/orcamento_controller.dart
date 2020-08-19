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
  String letraCabecalio;

  @observable
  String letraRodape;

  @observable
  String letraBase;

  @observable
  bool letraPreta = true;

  @observable
  bool letraBranca = false;

  @observable
  String corLetra = 'Preta';

  @observable
  Color colorCabecalio = Colors.blue[900];

  @observable
  Color colorRodape = Colors.grey[200];

  @observable
  Color colorBase = Colors.grey[800];

  @observable
  Color colorLetraCabecalio = Colors.white;

  @observable
  Color colorLetraRodape = Colors.black;

  @observable
  Color colorLetraBase = Colors.white;

  @action
  Future<String> convertColor(Color color, String nome, String letra) async {
    String colorString = color.toString(); // Color(0x12345678)
    String valueString =
        colorString.split('(0x')[1].split(')')[0]; // kind of hacky..
    String colorHex = valueString.toString();
    String colorLetra;
    Color colors;
    if (letra == 'Preta') {
      colorLetra = '000000';
      colors = Colors.black;
    } else {
      colorLetra = 'FFFFFF';
      colors = Colors.white;
    }
    if (nome == 'cabecalio') {
      cabecalio = colorHex;
      letraCabecalio = colorLetra;
      colorCabecalio = color;
      colorLetraCabecalio = colors;
    } else if (nome == 'rodape') {
      rodape = colorHex;
      letraRodape = colorLetra;
      colorLetraRodape = colors;
      colorRodape = color;
    } else {
      base = colorHex;
      colorLetraBase = colors;
      letraBase = colorLetra;
      colorBase = color;
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
