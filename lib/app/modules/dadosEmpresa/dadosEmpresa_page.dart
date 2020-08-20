import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:orcamento_mestre/app/modules/dadosEmpresa/formsComplemento.dart';
import 'package:orcamento_mestre/app/modules/orcamento/orcamento_controller.dart';
import 'package:orcamento_mestre/app/utils/dados_controller.dart';
import 'package:provider/provider.dart';
import 'dart:io';

class DadosEmpresaPage extends StatefulWidget {
  final String title;

  const DadosEmpresaPage({Key key, this.title = "Meus Dados"})
      : super(key: key);

  @override
  _DadosEmpresaPageState createState() => _DadosEmpresaPageState();
}

class _DadosEmpresaPageState extends State<DadosEmpresaPage> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    ScreenUtil.getInstance()..init(context);
    final controller = Provider.of<DadosController>(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              height: height * .20,
              width: width,
              margin: EdgeInsets.only(
                top: height * .01,
              ),
              child: Container(
                height: height * .18,
                width: width * .52,
                child: Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: Observer(builder: (_) {
                        return GestureDetector(
                          onTap: () async {
                            var image = await controller.getImage();
                            controller.logo = image;
                          },
                          child: (controller.logoStatus)
                              ? (kIsWeb)
                              ? Image.network(controller.imageFile.path)
                              : Image.file(
                              File(controller.imageFile.path))
                              : Container(
                            height: height * .125,
                            decoration: BoxDecoration(
                                color: Colors.grey[600],
                                borderRadius: BorderRadius.all(
                                    Radius.circular(16))),
                            margin: EdgeInsets.only(left: width * .02),
                            child: Center(
                              child: (controller.logoStatus)
                                  ? (kIsWeb)
                                  ? Image.network(
                                controller.imageFile.path,
                                fit: BoxFit.cover,
                              )
                                  : Image.file(
                                File(controller
                                    .imageFile.path),
                                fit: BoxFit.cover,
                              )
                                  : Text(
                                'Adicione sua Logo aqui',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                    Flexible(
                      flex: 2,
                      child: Container(
                        height: height * .06,
                        margin: EdgeInsets.only(
                          left: width * .012,
                        ),
                        child: TextFormField(
                          style: TextStyle(
                            fontSize: ScreenUtil.instance.setSp(45),
                          ),
                          controller: controller.nomeController,
                          onChanged: (newName) {
                            controller.nome = newName;
                          },
                          decoration: InputDecoration(
                            contentPadding: new EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 10.0),
                            labelText: "Nome",
                            border: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                  const Radius.circular(12.0)),
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          validator: (text) {
                            if (text.isEmpty)
                              return "O campo nome, está vazio";
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: height * .75,
              width: width,
              margin: EdgeInsets.only(top: height * .005),
              decoration: BoxDecoration(

                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16))),
              child: Column(
                children: [
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                          BorderRadius.all(Radius.circular(16))),
                      child: FormsComplemento()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
