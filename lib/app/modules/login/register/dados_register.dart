import 'package:combos/combos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_tags/flutter_tags.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:orcamento_mestre/app/modules/dadosEmpresa/dadosEmpresa_page.dart';
import 'package:orcamento_mestre/app/modules/dadosFreelancer/dadosFreelancer_page.dart';
import 'package:orcamento_mestre/app/modules/login/register/register_controller.dart';
import 'package:orcamento_mestre/app/utils/servicos_controller.dart';
import 'package:provider/provider.dart';

class DadosRegister extends StatefulWidget {
  @override
  _DadosRegisterState createState() => _DadosRegisterState();
}

class _DadosRegisterState extends State<DadosRegister> {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<RegisterController>(context);
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(children: <Widget>[servicos()]),
    ));
  }

  Widget servicos() {
    final servicosController = Provider.of<ServicosController>(context);
    return Column(
      children: <Widget>[
        Row(
          children: [
            Observer(builder: (_) {
              return Container(
                height: 60,
                width: MediaQuery.of(context).size.width * 0.7,
                child: TypeaheadCombo(
                  selected: servicosController.servico,
                  getList: (text) async {
                    await servicosController.getServicos();
                    return await servicosController.getSuggestions(text);
                  },
                  itemBuilder: (context, parameters, item, selected, text) =>
                      ListTile(title: Text(item ?? '<Empty>')),
                  onSelectedChanged: (item) {
                    setState(() {
                      servicosController.servico = item;
                    });
                    print(servicosController.servico);
                  },
                  getItemText: (item) => item,
                ),
              );
            }),
            Observer(builder: (_) {
              return IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    (servicosController.listServicosE.length >= 5)
                        ? Fluttertoast.showToast(
                            msg: 'Você só pode adicionar 5 itens')
                        : servicosController.listServicosE
                            .add(servicosController.servico);
                  });
            })
          ],
        ),
        Observer(builder: (_) {
          return Tags(
            itemCount: servicosController.listServicosE.length,
            itemBuilder: (int index) {
              final item = servicosController.listServicosE[index];
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
                    servicosController.listServicosE.removeAt(index);
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
    );
  }
}
