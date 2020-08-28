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
  String cabecalio = '0d47a1ff';

  @observable
  String rodape = '37474fff';

  @observable
  String base = 'cfd8dcff';

  @observable
  String letraCabecalio = 'FFFFFF';

  @observable
  String letraRodape = 'FFFFFF';

  @observable
  String letraBase = '000000';

  @observable
  bool letraPreta = true;

  @observable
  bool letraBranca = false;

  @observable
  String corLetra = 'Preta';

  @observable
  Color colorCabecalio = Colors.blue[900];

  @observable
  Color colorRodape = Colors.grey[800];

  @observable
  Color colorBase = Colors.grey[100];

  @observable
  Color colorLetraCabecalio = Colors.white;

  @observable
  Color colorLetraRodape = Colors.white;

  @observable
  Color colorLetraBase = Colors.black;

  @action
  Future<String> convertColor(Color color, String nome, String letra) async {
    String colorString = color
        .toString(); // recebe o valor da cor do colorpicker = Color(0x12345678)
    String valueString =
        colorString.split('(0x')[1].split(')')[0]; //retira o 0x e )
    String alfa1 = valueString.split(
        "")[0]; //tranforma a string em uma lista e pega o primeiro item = alfa1
    String alfa2 = valueString.split(
        "")[1]; //tranforma a string em uma lista e pega o segundo item = alfa2
    String color1 =
        valueString.substring(2); //retira os primeiros 2 itens da string
    String colorHex = '$color1$alfa1$alfa2'; //gera a string com o alfa no final
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
