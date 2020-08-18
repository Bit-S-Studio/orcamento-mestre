import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:orcamento_mestre/app/modules/dadosEmpresa/dadosEmpresa_page.dart';
import 'package:orcamento_mestre/app/modules/dadosFreelancer/dadosFreelancer_page.dart';
import 'package:orcamento_mestre/app/modules/orcamento/orcamento_controller.dart';
import 'package:orcamento_mestre/app/utils/dados_controller.dart';
import 'package:provider/provider.dart';

class TipoPage extends StatefulWidget {
  final String title;

  const TipoPage({Key key, this.title = "Meus Dados"}) : super(key: key);

  @override
  _TipoPageState createState() => _TipoPageState();
}

class _TipoPageState extends State<TipoPage> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    ScreenUtil.getInstance()..init(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: height * .1,
                width: width,
                child: widDropDown(),
              ),
              Container(
                height: height * .58,
                width: width,
                child: callFreeEmpresa(),
              )
            ],
          ),
        ));
  }

  Widget dropDown2() {
    final controller = Provider.of<DadosController>(context);
    return Observer(builder: (_) {
      return DropdownButton<String>(
        value: (controller.tipo != null)
            ? controller.tipo
            : controller.tipo = 'Empresa',
        icon: Icon(
          Icons.arrow_downward,
          color: Colors.white,
        ),
        dropdownColor: Colors.blue[900],
        iconSize: 24,
        elevation: 16,
        style: TextStyle(
          color: Colors.deepPurple,
          fontSize: ScreenUtil.instance.setSp(50),
        ),
        onChanged: (String newValue) {
          controller.tipo = newValue;
        },
        items:
            controller.listTipos.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: ScreenUtil.instance.setSp(60),
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          );
        }).toList(),
      );
    });
  }

  Widget widDropDown() {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.height;
    return Container(
      width: width,
      margin: EdgeInsets.only(
        bottom: height * .01,
      ),
      decoration: BoxDecoration(
        color: Colors.blue[900],
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Row(
        children: [
          Container(
            height: height * .023,
            width: width * .09,
            margin: EdgeInsets.only(left: width * .025, right: width * .015),
            child: Text(
              'Eu sou:',
              style: TextStyle(color: Colors.white),
            ),
          ),
          Container(
              height: height * .08,
              width: width * .25,
              child: Center(child: dropDown2())),
        ],
      ),
    );
  }

  Widget callFreeEmpresa() {
    final controller = Provider.of<DadosController>(context);
    var height = MediaQuery.of(context).size.height;
    return Observer(builder: (_) {
      return Container(
          height: height * 5,
          child: (controller.tipo == 'Empresa')
              ? DadosEmpresaPage()
              : DadosFreelancerPage());
    });
  }
}
