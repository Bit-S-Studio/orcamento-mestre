import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:orcamento_mestre/app/modules/dadosEmpresa/empresa_controller.dart';
import 'package:orcamento_mestre/app/modules/orcamento/orcamento_controller.dart';
import 'package:orcamento_mestre/app/utils/theme.dart';
import 'package:provider/provider.dart';

class FormsComplemento extends StatefulWidget {
  @override
  _FormsComplementoState createState() => _FormsComplementoState();
}

class _FormsComplementoState
    extends ModularState<FormsComplemento, EmpresaController> {
  @override
  Widget build(BuildContext context) {
    final oController = Provider.of<OrcamentoController>(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.height;
    return Container(
        height: height * .54,
        width: width,
        margin: EdgeInsets.only(top: height * .005),
        decoration: boxContainer,
        child: Column(children: [
          Container(
            height: height * .064,
            width: width,
            margin: EdgeInsets.only(
                top: height * .012, left: width * .02, right: width * .02),
            child: TextFormField(
              controller: oController.cepController,
              onChanged: (newCep) {
                oController.getCEP(newCep);
              },
              decoration: inputDecoration('Cep'),
              validator: (text) {
                if (text.isEmpty) return "O campo cep, está vazio";
              },
            ),
          ),
          Row(
            children: [
              Container(
                height: height * .06,
                width: width * .39,
                margin: EdgeInsets.only(
                    top: height * .015, left: width * .02, right: width * .005),
                child: TextFormField(
                  controller: oController.enderecoController,
                  onChanged: (newEndereco) {
                    oController.endereco = newEndereco;
                  },
                  decoration: inputDecoration('Logradouro'),
                  validator: (text) {
                    if (text.isEmpty) return "O campo logradouro, está vazio";
                  },
                ),
              ),
              Container(
                height: height * .06,
                width: width * .12,
                margin: EdgeInsets.only(
                    top: height * .015, right: width * .02),
                child: TextFormField(
                  controller: oController.numController,
                  onChanged: (newNum) {
                    oController.numero1 = newNum;
                  },
                  decoration: inputDecoration('Numero'),
                  validator: (text) {
                    if (text.isEmpty) return "O campo numero, está vazio";
                  },
                ),
              )
            ],
          ),
          Container(
            height: height * .06,
            width: width,
            margin: EdgeInsets.only(
                top: height * .015, left: width * .02, right: width * .02),
            child: TextFormField(
              controller: oController.bairroController,
              onChanged: (newBairro) {
                oController.bairro = newBairro;
              },
              decoration: inputDecoration('Bairro'),
              validator: (text) {
                if (text.isEmpty) return "O campo bairro, está vazio";
              },
            ),
          ),
          Row(
            children: [
              Container(
                height: height * .06,
                width: width * .39,
                margin: EdgeInsets.only(top: height * .015, left: width * .02),
                child: TextFormField(
                  controller: oController.cidadeController,
                  onChanged: (newCidade) {
                    oController.cidade = newCidade;
                  },
                  decoration: inputDecoration('Cidade'),
                  validator: (text) {
                    if (text.isEmpty) return "O campo cidade, está vazio";
                  },
                ),
              ),
              Container(
                height: height * .06,
                width: width * .12,
                margin: EdgeInsets.only(top: height * .015, left: width * .005),
                child: TextFormField(
                  controller: oController.ufController,
                  onChanged: (newUF) {
                    oController.uf = newUF;
                  },
                  decoration: inputDecoration('UF'),
                  validator: (text) {
                    if (text.isEmpty) return "O campo UF, está vazio";
                  },
                ),
              )
            ],
          ),
          Row(
            children: [
              Container(
                height: height * .06,
                width: width * .255,
                margin: EdgeInsets.only(top: height * .015, left: width * .02),
                child: TextFormField(
                  controller: oController.tel1Controller,
                  onChanged: (newTel1) {
                    oController.telefone1 = newTel1;
                  },
                  decoration: inputDecoration('Telefone 1'),
                  validator: (text) {
                    if (text.isEmpty) return "O campo Telefone 1, está vazio";
                  },
                ),
              ),
              Container(
                height: height * .06,
                width: width * .255,
                margin: EdgeInsets.only(top: height * .015, left: width * .005),
                child: TextFormField(
                  controller: oController.tel2Controller,
                  onChanged: (newTel2) {
                    oController.telefone2 = newTel2;
                  },
                  decoration: inputDecoration('Telefone 2'),
                  validator: (text) {
                    if (text.isEmpty) return "O campo Telefone 2, está vazio";
                  },
                ),
              ),
            ],
          ),
          Container(
            height: height * .06,
            width: width,
            margin: EdgeInsets.only(
                top: height * .015, left: width * .02, right: width * .02),
            child: TextFormField(
              controller: oController.emailController,
              onChanged: (newEmail) {
                oController.email = newEmail;
              },
              decoration: inputDecoration('E-mail'),
              validator: (text) {
                if (text.isEmpty) return "O campo nome, está vazio";
              },
            ),
          ),
          Container(
            height: height * .06,
            width: width,
            margin: EdgeInsets.only(
                top: height * .015, left: width * .02, right: width * .02),
            child: TextFormField(
              controller: oController.siteController,
              onChanged: (newSite) {
                oController.site = newSite;
              },
              decoration: InputDecoration(
                contentPadding:
                    new EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                labelText: "Site",
                border: OutlineInputBorder(
                  borderRadius:
                      const BorderRadius.all(const Radius.circular(12.0)),
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                ),
              ),
              validator: (text) {
                if (text.isEmpty) return "O campo nome, está vazio";
              },
            ),
          )
        ]));
  }
}
