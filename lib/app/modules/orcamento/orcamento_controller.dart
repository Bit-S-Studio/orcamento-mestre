import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:orcamento_mestre/app/modules/dadosProjeto/itemModel.dart';
import 'package:orcamento_mestre/app/modules/orcamento/orcamento_modal.dart';
import 'package:via_cep/via_cep.dart';

part 'orcamento_controller.g.dart';

class OrcamentoController = _OrcamentoControllerBase with _$OrcamentoController;

abstract class _OrcamentoControllerBase with Store {
  @observable
  String tipo;

  @observable
  String tipo2;

  @observable
  PickedFile logo;

  @observable
  String nomeEmpresa;

  @observable
  String nomeFreelancer;

  @observable
  String documento;

  @observable
  String telefone1;

  @observable
  TextEditingController tel1Controller = TextEditingController();

  @observable
  String telefone2;

  @observable
  TextEditingController tel2Controller = TextEditingController();

  @observable
  String email;

  @observable
  TextEditingController emailController = TextEditingController();

  @observable
  String site;

  @observable
  TextEditingController siteController = TextEditingController();

  @observable
  String cep;

  @observable
  TextEditingController cepController = TextEditingController();

  @observable
  TextEditingController enderecoController = TextEditingController();

  @observable
  String endereco;

  @observable
  TextEditingController numController = TextEditingController();

  @observable
  String numero;

  @observable
  String cidade;

  @observable
  TextEditingController cidadeController = TextEditingController();

  @observable
  String bairro;

  @observable
  TextEditingController bairroController = TextEditingController();

  @observable
  String numero1;

  @observable
  TextEditingController ufController = TextEditingController();

  @observable
  String uf;

  @action
  Future getCEP(String cep) async {
    var CEP = new via_cep();
    var result = await CEP.searchCEP(cep, 'json', '');
    if (CEP.getResponse() == 200) {
      enderecoController.text = CEP.getLogradouro();
      endereco = CEP.getLogradouro();
      cidadeController.text = CEP.getLocalidade();
      cidade = CEP.getLocalidade();
      bairroController.text = CEP.getBairro();
      bairro = CEP.getBairro();
      ufController.text = CEP.getUF();
      uf = CEP.getUF();
    } else {
      print('Código de Retorno: ' + CEP.getResponse().toString());
      print('Erro: ' + CEP.getBody());
    }
  }

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
