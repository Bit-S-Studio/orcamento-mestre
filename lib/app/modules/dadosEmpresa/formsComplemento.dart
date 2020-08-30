import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    ScreenUtil.getInstance()..init(context);
    final controller = Provider.of<DadosController>(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.height;
    return Container(
        height: height * .68,
        width: width * .52,
        margin: EdgeInsets.only(
          top: height * .005,
        ),
        child: Column(children: [
          Container(
            height: height * .064,
            width: width,
            margin: EdgeInsets.only(
                top: height * .023,
                ),
            child: TextFormField(
              style: TextStyle(
                fontSize: ScreenUtil.instance.setSp(45),
              ),
              controller: controller.cepController,
              onChanged: (newCep) {
                controller.getCEP(newCep);
              },
              decoration: InputDecoration(
                contentPadding: new EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 10.0),
                labelText: "Cep*",
                labelStyle: TextStyle(
                    color: Colors.blue
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                      const Radius.circular(12.0)),
                  borderSide: BorderSide(
                      color: Colors.blue, width: 2.0
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                      const Radius.circular(12.0)),
                  borderSide: BorderSide(
                      color: Colors.blue[900], width: 3.0
                  ),
                ),
              ),
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
                  height: height * .064,
                  margin: EdgeInsets.only(
                      top: height * .015,
                      right: width * .005),
                  child: TextFormField(
                    style: TextStyle(
                      fontSize: ScreenUtil.instance.setSp(45),
                    ),
                    controller: controller.enderecoController,
                    onChanged: (newEndereco) {
                      controller.endereco = newEndereco;
                    },
                    decoration: InputDecoration(
                      contentPadding: new EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      labelText: "Lagradouro*",
                      labelStyle: TextStyle(
                          color: Colors.blue
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                            const Radius.circular(12.0)),
                        borderSide: BorderSide(
                            color: Colors.blue, width: 2.0
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                            const Radius.circular(12.0)),
                        borderSide: BorderSide(
                            color: Colors.blue[900], width: 3.0
                        ),
                      ),
                    ),
                    validator: (text) {
                      if (text.isEmpty) return "O campo logradouro está vazio";
                    },
                  ),
                ),
              ),
              Flexible(
                flex: 3,
                child: Container(
                  height: height * .064,
                  margin:
                      EdgeInsets.only(
                          top: height * .015,
                          ),
                  child: TextFormField(
                    style: TextStyle(
                      fontSize: ScreenUtil.instance.setSp(45),
                    ),
                    controller: controller.numController,
                    onChanged: (newNum) {
                      controller.numero = newNum;
                    },
                    decoration: InputDecoration(
                      contentPadding: new EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      labelText: 'N°*',
                      labelStyle: TextStyle(
                          color: Colors.blue
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                            const Radius.circular(12.0)),
                        borderSide: BorderSide(
                            color: Colors.blue, width: 2.0
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                            const Radius.circular(12.0)),
                        borderSide: BorderSide(
                            color: Colors.blue[900], width: 3.0
                        ),
                      ),
                    ),
                    validator: (text) {
                      if (text.isEmpty) return "O campo numero está vazio";
                    },
                  ),
                ),
              )
            ],
          ),
          Container(
            height: height * .064,
            width: width,
            margin: EdgeInsets.only(
                top: height * .015,
                ),
            child: TextFormField(
              style: TextStyle(
                fontSize: ScreenUtil.instance.setSp(45),
              ),
              controller: controller.bairroController,
              onChanged: (newBairro) {
                controller.bairro = newBairro;
              },
              decoration: InputDecoration(
                contentPadding: new EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 10.0),
                labelText: 'Bairro*',
                labelStyle: TextStyle(
                    color: Colors.blue
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                      const Radius.circular(12.0)),
                  borderSide: BorderSide(
                      color: Colors.blue, width: 2.0
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                      const Radius.circular(12.0)),
                  borderSide: BorderSide(
                      color: Colors.blue[900], width: 3.0
                  ),
                ),
              ),
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
                  height: height * .064,
                  width: width * .355,
                  margin:
                      EdgeInsets.only(
                          top: height * .015,
                      ),
                  child: TextFormField(
                    style: TextStyle(
                      fontSize: ScreenUtil.instance.setSp(45),
                    ),
                    controller: controller.cidadeController,
                    onChanged: (newCidade) {
                      controller.cidade = newCidade;
                    },
                    decoration: InputDecoration(
                      contentPadding: new EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      labelText: 'Cidade*',
                      labelStyle: TextStyle(
                          color: Colors.blue
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                            const Radius.circular(12.0)),
                        borderSide: BorderSide(
                            color: Colors.blue, width: 2.0
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                            const Radius.circular(12.0)),
                        borderSide: BorderSide(
                            color: Colors.blue[900], width: 3.0
                        ),
                      ),
                    ),
                    validator: (text) {
                      if (text.isEmpty) return "O campo cidade está vazio";
                    },
                  ),
                ),
              ),
              Flexible(
                flex: 3,
                child: Container(
                  height: height * .064,
                  width: width,
                  margin:
                      EdgeInsets.only(
                          top: height * .015,
                          left: width * .005),
                  child: TextFormField(
                    style: TextStyle(
                      fontSize: ScreenUtil.instance.setSp(45),
                    ),
                    controller: controller.ufController,
                    onChanged: (newUF) {
                      controller.uf = newUF;
                    },
                    decoration: InputDecoration(
                      contentPadding: new EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      labelText: 'UF*',
                      labelStyle: TextStyle(
                          color: Colors.blue
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                            const Radius.circular(12.0)),
                        borderSide: BorderSide(
                            color: Colors.blue, width: 2.0
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                            const Radius.circular(12.0)),
                        borderSide: BorderSide(
                            color: Colors.blue[900], width: 3.0
                        ),
                      ),
                    ),
                    validator: (text) {
                      if (text.isEmpty) return "O campo UF está vazio";
                    },
                  ),
                ),
              )
            ],
          ),
          Container(
            height: height * .064,
            width: width,
            margin: EdgeInsets.only(
                top: height * .015,
            ),
            child: TextFormField(
              style: TextStyle(
                fontSize: ScreenUtil.instance.setSp(45),
              ),
              controller: controller.docController,
              onChanged: (newDoc) {
                controller.documento = newDoc;
              },
              decoration: InputDecoration(
                contentPadding: new EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 10.0),
                labelText: 'CPF ou CNPJ',
                labelStyle: TextStyle(
                    color: Colors.blue
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                      const Radius.circular(12.0)),
                  borderSide: BorderSide(
                      color: Colors.blue, width: 2.0
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                      const Radius.circular(12.0)),
                  borderSide: BorderSide(
                      color: Colors.blue[900], width: 3.0
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: [
              Flexible(
                flex: 5,
                child: Container(
                  height: height * .064,
                  width: width,
                  margin:
                      EdgeInsets.only(
                          top: height * .015,
                      ),
                  child: TextFormField(
                    style: TextStyle(
                      fontSize: ScreenUtil.instance.setSp(45),
                    ),
                    controller: controller.tel1Controller,
                    onChanged: (newTel1) {
                      controller.telefone1 = newTel1;
                    },
                    decoration: InputDecoration(
                      contentPadding: new EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      labelText: 'Telefone 1*',
                      labelStyle: TextStyle(
                          color: Colors.blue
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                            const Radius.circular(12.0)),
                        borderSide: BorderSide(
                            color: Colors.blue, width: 2.0
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                            const Radius.circular(12.0)),
                        borderSide: BorderSide(
                            color: Colors.blue[900], width: 3.0
                        ),
                      ),
                    ),
                    validator: (text) {
                      if (text.isEmpty) return "O campo Telefone 1 está vazio";
                    },
                  ),
                ),
              ),
              Flexible(
                flex: 5,
                child: Container(
                  height: height * .064,
                  width: width,
                  margin:
                      EdgeInsets.only(
                          top: height * .015, left: width * .005),
                  child: TextFormField(
                    style: TextStyle(
                      fontSize: ScreenUtil.instance.setSp(45),
                    ),
                    controller: controller.tel2Controller,
                    onChanged: (newTel2) {
                      controller.telefone2 = newTel2;
                    },
                    decoration: InputDecoration(
                      contentPadding: new EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      labelText: 'Telefone 2',
                      labelStyle: TextStyle(
                          color: Colors.blue
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                            const Radius.circular(12.0)),
                        borderSide: BorderSide(
                            color: Colors.blue, width: 2.0
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                            const Radius.circular(12.0)),
                        borderSide: BorderSide(
                            color: Colors.blue[900], width: 3.0
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: height * .064,
            width: width,
            margin: EdgeInsets.only(
                top: height * .015,
            ),
            child: TextFormField(
              style: TextStyle(
                fontSize: ScreenUtil.instance.setSp(45),
              ),
              controller: controller.emailController,
              onChanged: (newEmail) {
                controller.email = newEmail;
              },
              decoration: InputDecoration(
                contentPadding: new EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 10.0),
                labelText: 'E-mail*',
                labelStyle: TextStyle(
                    color: Colors.blue
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                      const Radius.circular(12.0)),
                  borderSide: BorderSide(
                      color: Colors.blue, width: 2.0
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                      const Radius.circular(12.0)),
                  borderSide: BorderSide(
                      color: Colors.blue[900], width: 3.0
                  ),
                ),
              ),
              validator: (text) {
                if (text.isEmpty) return "O campo e-mail está vazio";
              },
            ),
          ),
          Container(
            height: height * .064,
            width: width,
            margin: EdgeInsets.only(
                top: height * .015,
            ),
            child: TextFormField(
              style: TextStyle(
                fontSize: ScreenUtil.instance.setSp(45),
              ),
              controller: controller.siteController,
              onChanged: (newSite) {
                controller.site = newSite;
              },
              decoration: InputDecoration(
                contentPadding: new EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 10.0),
                labelText: 'Site',
                labelStyle: TextStyle(
                    color: Colors.blue
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                      const Radius.circular(12.0)),
                  borderSide: BorderSide(
                      color: Colors.blue, width: 2.0
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                      const Radius.circular(12.0)),
                  borderSide: BorderSide(
                      color: Colors.blue[900], width: 3.0
                  ),
                ),
              ),
            ),
          )
        ]));
  }
}
