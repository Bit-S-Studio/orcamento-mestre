import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:orcamento_mestre/app/modules/dadosEmpresa/formsComplemento.dart';
import 'package:orcamento_mestre/app/modules/orcamento/orcamento_controller.dart';
import 'package:provider/provider.dart';
import 'empresa_controller.dart';
import 'dart:io';

class DadosEmpresaPage extends StatefulWidget {
  final String title;

  const DadosEmpresaPage({Key key, this.title = "Meus Dados"})
      : super(key: key);

  @override
  _DadosEmpresaPageState createState() => _DadosEmpresaPageState();
}

class _DadosEmpresaPageState
    extends ModularState<DadosEmpresaPage, EmpresaController> {

  MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    keywords: <String>['cursos', 'beautiful apps'],
    contentUrl: 'https://flutter.io',
    childDirected: false,
    //testDevices: <String>[],
  );

  BannerAd myBanner;

  void startBanner() {
    myBanner = BannerAd(
      adUnitId: BannerAd.testAdUnitId,
      size: AdSize.smartBanner,
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        if (event == MobileAdEvent.opened) {
          // MobileAdEvent.opened
          // MobileAdEvent.clicked
          // MobileAdEvent.closed
          // MobileAdEvent.failedToLoad
          // MobileAdEvent.impression
          // MobileAdEvent.leftApplication
        }
        print("BannerAd event is $event");
      },
    );
  }

  void displayBanner() {
    myBanner
      ..load()
      ..show(
        anchorOffset: 95.0,
        anchorType: AnchorType.top,
      );
  }

  @override
  void dispose() {
    myBanner?.dispose();
    myBanner?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    FirebaseAdMob.instance
        .initialize(appId: "ca-app-pub-3740593238666941~2885272429");

    startBanner();
    displayBanner();
  }

  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    final oController = Provider.of<OrcamentoController>(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                height: height * .20,
                width: width,
                margin: EdgeInsets.only(
                  top: height * .03,
                ),
                decoration: BoxDecoration(
                    color: Colors.blue[900],
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16))),
                child: Container(
                  height: height *.18,
                  width: width *.52,
                  padding: EdgeInsets.only(
                    right: width *.005,
                  ),
                  margin: EdgeInsets.only(
                    top: height *.015,
                    bottom: height *.015,
                    left: width *.015,
                    right: width *.015,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(16)
                      )),
                  child: Row(
                    children: [
                      Observer(builder: (_) {
                        return GestureDetector(
                          onTap: () async {
                            var image = await controller.getImage();
                            oController.logo = image;
                          },
                          child: (controller.logoStatus)
                              ? (kIsWeb)
                              ? Image.network(controller.imageFile.path)
                              : Image.file(File(controller.imageFile.path))
                              : Container(
                            height: height * .15,
                            width: width * .15,
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
                                File(controller.imageFile.path),
                                fit: BoxFit.cover,
                              )
                                  : Text(
                                'Adicione sua Logo aqui',
                                textAlign: TextAlign.center,
                                style:
                                TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        );
                      }),
                      Container(
                        height: height * .06,
                        width: width * .33,
                        margin: EdgeInsets.only(
                          left: width * .012,
                        ),
                        child: TextFormField(
                          controller: controller.nameEmpresa,
                          onChanged: (newName) {
                            oController.nomeEmpresa = newName;
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
                            if (text.isEmpty) return "O campo nome, está vazio";
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: height * .65,
                width: width,
                margin: EdgeInsets.only(top: height * .005),
                decoration: BoxDecoration(
                    color: Colors.blue[900],
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16)
                    )
                ),
                child: Column(
                  children: [
                    Container(
                      height: height * .06,
                      width: width,
                      padding:
                      EdgeInsets.only(top: height * .02, left: width * .02),
                      child: Text(
                        'Complementos',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(16))
                        ),
                        child: FormsComplemento()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
