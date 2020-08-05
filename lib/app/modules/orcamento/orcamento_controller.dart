import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
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

  @action
  changeNome(String newNome) => nomeEmpresa = newNome;

  @observable
  String documento;

  @action
  changeDoc(String newDoc) => documento = newDoc;

  @observable
  String telefone1;

  @action
  changeTelefone(String newTelefone1) => telefone1 = newTelefone1;

  @observable
  TextEditingController tel1Controller = TextEditingController();

  @observable
  String telefone2;

  @action
  changeTelefone2(String newTelefone1) => telefone2 = newTelefone1;

  @observable
  TextEditingController tel2Controller = TextEditingController();

  @observable
  String email;

  @action
  changeEmail(String newEmail) => email = newEmail;

  @observable
  TextEditingController emailController = TextEditingController();

  @observable
  String site;

  @action
  changeSite(String newSite) => site = newSite;

  @observable
  TextEditingController siteController = TextEditingController();

  @observable
  String cep;

  @action
  changeCep(String newCep) => cep = newCep;

  @observable
  TextEditingController cepController = TextEditingController();

  @observable
  TextEditingController enderecoController = TextEditingController();

  @observable
  String endereco;

  @action
  changeEndereco(String newEndereco) => endereco = newEndereco;

  @observable
  TextEditingController numController = TextEditingController();

  @observable
  String numero;

  @action
  changeNum(String newNum) => numero = newNum;

  @observable
  String cidade;

  @action
  changeCidade(String newCidade) => cidade = newCidade;

  @observable
  TextEditingController cidadeController = TextEditingController();

  @observable
  String bairro;

  @action
  changeBairro(String newBairro) => bairro = newBairro;

  @observable
  TextEditingController bairroController = TextEditingController();

  @observable
  String numero1;

  @action
  changeNumero(String newNumero) => numero1 = newNumero;

  @observable
  TextEditingController ufController = TextEditingController();

  @observable
  String uf;

  @action
  changeUF(String newUF) => uf = newUF;

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
