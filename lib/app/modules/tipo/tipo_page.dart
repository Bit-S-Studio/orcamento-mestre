import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:orcamento_mestre/app/modules/orcamento/orcamento_controller.dart';
import 'package:orcamento_mestre/app/utils/theme.dart';
import 'package:provider/provider.dart';
import 'tipo_controller.dart';

class TipoPage extends StatefulWidget {
  final String title;

  const TipoPage({Key key, this.title = "Meus Dados"}) : super(key: key);

  @override
  _TipoPageState createState() => _TipoPageState();
}

class _TipoPageState extends ModularState<TipoPage, TipoController> {
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
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Text(
          widget.title,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 23,
              color: Colors.blue[900]),
        ),
      ),
      body: SingleChildScrollView(
          child: Container(
        margin: EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              height: height * .09,
              width: width,
              margin: EdgeInsets.only(top: height * .13),
          decoration: BoxDecoration(
            color: Colors.blue[900],
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
              child: Container(
                margin: EdgeInsets.only(
                    top: height * .01,
                  bottom: height * .01,
                  left: width *.01,
                  right: width *.01
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: Row(
                  children: [
                    Container(
                      height: height * .023,
                      width: width * .07,
                      margin: EdgeInsets.only(
                          left: width * .015, right: width * .015),
                      child: Text(
                        'Eu sou:',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    Container(
                        height: height * .08,
                        width: width * .18,
                        child: Center(child: dropDown2())),
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }

  Widget dropDown2() {
    final oController = Provider.of<OrcamentoController>(context);
    oController.tipo2 = 'Empresa';
    return Observer(builder: (_) {
      return DropdownButton<String>(
        value: oController.tipo2,
        icon: Icon(
          Icons.arrow_downward,
          color: Colors.black87,
        ),
        dropdownColor: Colors.blue[900],
        iconSize: 24,
        elevation: 16,
        style: TextStyle(color: Colors.deepPurple),
        onChanged: (String newValue) {
          oController.tipo2 = newValue;
        },
        items:
            controller.listTipos2.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold),
            ),
          );
        }).toList(),
      );
    });
  }
}
