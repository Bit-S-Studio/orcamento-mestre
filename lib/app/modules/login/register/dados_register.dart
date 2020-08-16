import 'package:combos/combos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_tags/flutter_tags.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:orcamento_mestre/app/modules/dadosEmpresa/dadosEmpresa_page.dart';
import 'package:orcamento_mestre/app/modules/dadosFreelancer/dadosFreelancer_page.dart';
import 'package:orcamento_mestre/app/modules/login/register/register_controller.dart';
import 'package:orcamento_mestre/app/utils/customHasuraConnect.dart';
import 'package:orcamento_mestre/app/utils/dados_controller.dart';
import 'package:orcamento_mestre/app/utils/servicos_controller.dart';
import 'package:orcamento_mestre/app/utils/users/user_controller.dart';
import 'package:provider/provider.dart';

class DadosRegister extends StatefulWidget {
  @override
  _DadosRegisterState createState() => _DadosRegisterState();
}

class _DadosRegisterState extends State<DadosRegister> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.height;
    final controller = Provider.of<RegisterController>(context);
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          Observer(builder: (_) {
            return Container(
              height: (controller.tipo == 'Empresa')
                  ? (height * 1.04)
                  : (height * 0.72),
              width: width,
              child: callFreeEmpresa(),
            );
          }),
          servicos(),
          SizedBox(height: height * 0.1)
        ]),
      ),
      floatingActionButton: button(),
    );
  }

  Widget callFreeEmpresa() {
    final controller = Provider.of<DadosController>(context);
    return Observer(builder: (_) {
      return (controller.tipo == 'Empresa')
          ? DadosEmpresaPage()
          : DadosFreelancerPage();
    });
  }

  Widget servicos() {
    final servicosController = Provider.of<ServicosController>(context);
    final dadosController = Provider.of<DadosController>(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.4,
      width: width,
      margin: EdgeInsets.all(height * .02),
      decoration: BoxDecoration(
          color: Colors.blue[900],
          borderRadius: BorderRadius.all(Radius.circular(16))),
      child: Container(
        margin: EdgeInsets.all(height * .005),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(16))),
        child: Column(
          children: <Widget>[
            Row(
              children: [
                Flexible(
                  flex: 9,
                  child: Observer(builder: (_) {
                    return Container(
                      height: 60,
                      margin: EdgeInsets.all(height * .01),
                      child: TypeaheadCombo(
                        selected: servicosController.servico,
                        getList: (text) async {
                          await servicosController.getServicos();
                          return await servicosController.getSuggestions(text);
                        },
                        itemBuilder:
                            (context, parameters, item, selected, text) =>
                                ListTile(title: Text(item ?? '<Empty>')),
                        onSelectedChanged: (item) {
                          setState(() {
                            servicosController.servico = item;
                          });
                          print(servicosController.servico);
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                  const Radius.circular(12.0)),
                            ),
                            hintText: 'Adicione seus serviços'),
                        getItemText: (item) => item,
                      ),
                    );
                  }),
                ),
                Flexible(
                  flex: 1,
                  child: Observer(builder: (_) {
                    return IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          (dadosController.listServicos.length >= 5)
                              ? Fluttertoast.showToast(
                                  msg: 'Você só pode adicionar 5 itens')
                              : dadosController.listServicos
                                  .add(servicosController.servico);
                        });
                  }),
                )
              ],
            ),
            Observer(builder: (_) {
              return Tags(
                itemCount: dadosController.listServicos.length,
                itemBuilder: (int index) {
                  final item = dadosController.listServicos[index];
                  return ItemTags(
                    key: Key(index.toString()),
                    index: index,
                    title: item,
                    activeColor: Colors.blue[900],
                    textStyle: TextStyle(
                      fontSize: 14,
                    ),
                    combine: ItemTagsCombine.withTextBefore,
                    removeButton: ItemTagsRemoveButton(
                      onRemoved: () {
                        dadosController.listServicos.removeAt(index);
                        return true;
                      },
                    ),
                    onPressed: (item) => print(item),
                    onLongPressed: (item) => print(item),
                  );
                },
              );
            })
          ],
        ),
      ),
    );
  }

  Widget button() {
    final controller = Provider.of<DadosController>(context);
    return FloatingActionButton(
        backgroundColor: Colors.blue[900],
        child: Icon(Icons.save),
        onPressed: () async {
          if (controller.imgUrl == null) {
            controller.imgUrl = 'vazio';
          } else if (controller.telefone2 == null) {
            controller.telefone2 = 'vazio';
          } else if (controller.site == null) {
            controller.site = 'vazio';
          }
          print(controller.uid);
          print(controller.imgUrl);
          print(controller.nome);
          print(controller.email);
          print(controller.cep);
          print(controller.endereco);
          print(controller.bairro);
          print(controller.cidade);
          print(controller.uf);
          print(controller.telefone1);
          print(controller.telefone2);
          print(controller.site);
          await controller.setDados(
              tipo: controller.tipo,
              id: controller.uid,
              logo: controller.imgUrl,
              nome: controller.nome,
              email: controller.email,
              cep: controller.cep,
              logradouro: controller.endereco,
              bairro: controller.bairro,
              cidade: controller.cidade,
              uf: controller.uf,
              telefone1: controller.telefone1,
              telefone2: controller.telefone2,
              site: controller.site,
              listServicos: controller.listServicos);
          Modular.to.pushNamedAndRemoveUntil('/home', ModalRoute.withName('/'));
        });
  }
}
