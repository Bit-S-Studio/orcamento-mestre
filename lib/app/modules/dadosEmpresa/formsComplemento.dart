import 'package:flutter/material.dart';
import 'package:orcamento_mestre/app/utils/dados_controller.dart';
import 'package:orcamento_mestre/app/utils/theme.dart';
import 'package:provider/provider.dart';

class FormsComplemento extends StatefulWidget {
  @override
  _FormsComplementoState createState() => _FormsComplementoState();
}

class _FormsComplementoState extends State<FormsComplemento> {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<DadosController>(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.height;
    return Container(
        height: height * .565,
        width: width * .52,
        margin: EdgeInsets.only(
          top: height * .005,
        ),
        child: Column(children: [
          Container(
            height: height * .064,
            width: width,
            margin: EdgeInsets.only(
                top: height * .023, left: width * .02, right: width * .02),
            child: TextFormField(
              controller: controller.cepController,
              onChanged: (newCep) {
                controller.getCEP(newCep);
              },
              decoration: inputDecoration('Cep*'),
              validator: (text) {
                if (text.isEmpty) return "O campo cep está vazio";
              },
            ),
          ),
          Row(
            children: [
              Flexible(
                flex: 7,
                child: Container(
                  height: height * .06,
                  margin: EdgeInsets.only(
                      top: height * .015,
                      left: width * .02,
                      right: width * .005),
                  child: TextFormField(
                    controller: controller.enderecoController,
                    onChanged: (newEndereco) {
                      controller.endereco = newEndereco;
                    },
                    decoration: inputDecoration('Logradouro*'),
                    validator: (text) {
                      if (text.isEmpty) return "O campo logradouro está vazio";
                    },
                  ),
                ),
              ),
              Flexible(
                flex: 3,
                child: Container(
                  height: height * .06,
                  margin:
                      EdgeInsets.only(top: height * .015, right: width * .02),
                  child: TextFormField(
                    controller: controller.numController,
                    onChanged: (newNum) {
                      controller.numero1 = newNum;
                    },
                    decoration: inputDecoration('Numero*'),
                    validator: (text) {
                      if (text.isEmpty) return "O campo numero está vazio";
                    },
                  ),
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
              controller: controller.bairroController,
              onChanged: (newBairro) {
                controller.bairro = newBairro;
              },
              decoration: inputDecoration('Bairro*'),
              validator: (text) {
                if (text.isEmpty) return "O campo bairro está vazio";
              },
            ),
          ),
          Row(
            children: [
              Flexible(
                flex: 7,
                child: Container(
                  height: height * .06,
                  width: width * .355,
                  margin:
                      EdgeInsets.only(top: height * .015, left: width * .02),
                  child: TextFormField(
                    controller: controller.cidadeController,
                    onChanged: (newCidade) {
                      controller.cidade = newCidade;
                    },
                    decoration: inputDecoration('Cidade*'),
                    validator: (text) {
                      if (text.isEmpty) return "O campo cidade está vazio";
                    },
                  ),
                ),
              ),
              Flexible(
                flex: 3,
                child: Container(
                  height: height * .06,
                  width: width * .12,
                  margin:
                      EdgeInsets.only(top: height * .015, left: width * .005),
                  child: TextFormField(
                    controller: controller.ufController,
                    onChanged: (newUF) {
                      controller.uf = newUF;
                    },
                    decoration: inputDecoration('UF*'),
                    validator: (text) {
                      if (text.isEmpty) return "O campo UF está vazio";
                    },
                  ),
                ),
              )
            ],
          ),
          Row(
            children: [
              Flexible(
                flex: 5,
                child: Container(
                  height: height * .06,
                  width: width * .238,
                  margin:
                      EdgeInsets.only(top: height * .015, left: width * .02),
                  child: TextFormField(
                    controller: controller.tel1Controller,
                    onChanged: (newTel1) {
                      controller.telefone1 = newTel1;
                    },
                    decoration: inputDecoration('Telefone 1*'),
                    validator: (text) {
                      if (text.isEmpty) return "O campo Telefone 1 está vazio";
                    },
                  ),
                ),
              ),
              Flexible(
                flex: 5,
                child: Container(
                  height: height * .06,
                  width: width * .238,
                  margin:
                      EdgeInsets.only(top: height * .015, left: width * .005),
                  child: TextFormField(
                    controller: controller.tel2Controller,
                    onChanged: (newTel2) {
                      controller.telefone2 = newTel2;
                    },
                    decoration: inputDecoration('Telefone 2'),
                  ),
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
              controller: controller.emailController,
              onChanged: (newEmail) {
                controller.email = newEmail;
              },
              decoration: inputDecoration('E-mail*'),
              validator: (text) {
                if (text.isEmpty) return "O campo e-mail está vazio";
              },
            ),
          ),
          Container(
            height: height * .06,
            width: width,
            margin: EdgeInsets.only(
                top: height * .015, left: width * .02, right: width * .02),
            child: TextFormField(
              controller: controller.siteController,
              onChanged: (newSite) {
                controller.site = newSite;
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
            ),
          )
        ]));
  }
}
