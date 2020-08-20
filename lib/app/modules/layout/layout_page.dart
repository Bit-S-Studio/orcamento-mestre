import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:orcamento_mestre/app/modules/layout/get_color.dart';
import 'package:orcamento_mestre/app/modules/orcamento/orcamento_controller.dart';
import 'package:provider/provider.dart';
import 'layout_controller.dart';

class LayoutPage extends StatefulWidget {
  final String title;

  const LayoutPage({Key key, this.title = "Layout"}) : super(key: key);

  @override
  _LayoutPageState createState() => _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPage> {
  //use 'controller' variable to access controller
  @override
  Widget build(BuildContext context) {
    ScreenUtil.getInstance()..init(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.height;
    final controller = Provider.of<LayoutController>(context);
    final oController = Provider.of<OrcamentoController>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: height * .1,
              width: width,
              padding: EdgeInsets.only(top: height * .035),
              child: Text(
                'Personalize as cores do seu orçamento',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: ScreenUtil.instance.setSp(45),
                    fontWeight: FontWeight.bold),
              ),
            ),
            Observer(builder: (_) {
              return Row(
                children: [
                  Container(
                    width: width * .36,
                    margin: EdgeInsets.only(
                    left: width * .01,
                    ),
                    child: Column(
                      children: <Widget>[
                        Container(
                          color: oController.colorCabecalio,
                          height: height * .1,
                          width: width,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: height * .05,
                                    width: width * .05,
                                    padding: EdgeInsets.only(
                                      top: height * .015,
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Logo',
                                        style: TextStyle(
                                          color:
                                              oController.colorLetraCabecalio,
                                          fontSize:
                                              ScreenUtil.instance.setSp(35),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: height * .05,
                                    width: width * .11,
                                    padding: EdgeInsets.only(
                                        top: height * .015, left: width * .005),
                                    child: Center(
                                      child: Text(
                                        'Nome Empresa',
                                        style: TextStyle(
                                          color:
                                              oController.colorLetraCabecalio,
                                          fontSize:
                                              ScreenUtil.instance.setSp(25),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: height * .05,
                                    width: width * .2,
                                    padding: EdgeInsets.only(
                                        top: height * .015,
                                        left: width * .03,
                                        right: width * .005),
                                    child: Center(
                                      child: Text(
                                        'Descrição/resumo do orçamento',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color:
                                              oController.colorLetraCabecalio,
                                          fontSize:
                                              ScreenUtil.instance.setSp(25),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                height: height * .05,
                                width: width,
                                padding: EdgeInsets.only(
                                    top: height * .03, left: width * .32),
                                child: Text(
                                  'Data',
                                  style: TextStyle(
                                    color: oController.colorLetraCabecalio,
                                    fontSize: ScreenUtil.instance.setSp(25),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          color: oController.colorBase,
                          height: height * .3,
                          width: width,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: height * .02,
                                    width: width * .18,
                                    margin: EdgeInsets.only(
                                        top: height * .01, left: width * .01),
                                    child: Text(
                                      '####### ## #####',
                                      style: TextStyle(
                                        color: oController.colorLetraBase,
                                        fontSize: ScreenUtil.instance.setSp(25),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: height * .01),
                                    child: Text(
                                      '##,###',
                                      style: TextStyle(
                                        color: oController.colorLetraBase,
                                        fontSize: ScreenUtil.instance.setSp(25),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: height * .01, left: width * .01),
                                    child: Text(
                                      '## #.####,##',
                                      style: TextStyle(
                                        color: oController.colorLetraBase,
                                        fontSize: ScreenUtil.instance.setSp(25),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: height * .02,
                                    width: width * .18,
                                    margin: EdgeInsets.only(
                                        top: height * .01, left: width * .01),
                                    child: Text(
                                      '####### ## #####',
                                      style: TextStyle(
                                        color: oController.colorLetraBase,
                                        fontSize: ScreenUtil.instance.setSp(25),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: height * .01),
                                    child: Text(
                                      '##,###',
                                      style: TextStyle(
                                        color: oController.colorLetraBase,
                                        fontSize: ScreenUtil.instance.setSp(25),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: height * .01, left: width * .01),
                                    child: Text(
                                      '## #.####,##',
                                      style: TextStyle(
                                        color: oController.colorLetraBase,
                                        fontSize: ScreenUtil.instance.setSp(25),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: height * .02,
                                    width: width * .18,
                                    margin: EdgeInsets.only(
                                        top: height * .01, left: width * .01),
                                    child: Text(
                                      '####### ## #####',
                                      style: TextStyle(
                                        color: oController.colorLetraBase,
                                        fontSize: ScreenUtil.instance.setSp(25),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: height * .01),
                                    child: Text(
                                      '##,###',
                                      style: TextStyle(
                                        color: oController.colorLetraBase,
                                        fontSize: ScreenUtil.instance.setSp(25),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: height * .01, left: width * .01),
                                    child: Text(
                                      '## #.####,##',
                                      style: TextStyle(
                                        color: oController.colorLetraBase,
                                        fontSize: ScreenUtil.instance.setSp(25),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: height * .02,
                                    width: width * .18,
                                    margin: EdgeInsets.only(
                                        top: height * .01, left: width * .01),
                                    child: Text(
                                      '####### ## #####',
                                      style: TextStyle(
                                        color: oController.colorLetraBase,
                                        fontSize: ScreenUtil.instance.setSp(25),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: height * .01),
                                    child: Text(
                                      '##,###',
                                      style: TextStyle(
                                        color: oController.colorLetraBase,
                                        fontSize: ScreenUtil.instance.setSp(25),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: height * .01, left: width * .01),
                                    child: Text(
                                      '## #.####,##',
                                      style: TextStyle(
                                        color: oController.colorLetraBase,
                                        fontSize: ScreenUtil.instance.setSp(25),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: height * .02,
                                    width: width * .18,
                                    margin: EdgeInsets.only(
                                        top: height * .01, left: width * .01),
                                    child: Text(
                                      '####### ## #####',
                                      style: TextStyle(
                                        color: oController.colorLetraBase,
                                        fontSize: ScreenUtil.instance.setSp(25),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: height * .01),
                                    child: Text(
                                      '##,###',
                                      style: TextStyle(
                                        color: oController.colorLetraBase,
                                        fontSize: ScreenUtil.instance.setSp(25),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: height * .01, left: width * .01),
                                    child: Text(
                                      '## #.####,##',
                                      style: TextStyle(
                                        color: oController.colorLetraBase,
                                        fontSize: ScreenUtil.instance.setSp(25),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: height * .02,
                                    width: width * .18,
                                    margin: EdgeInsets.only(
                                        top: height * .01, left: width * .01),
                                    child: Text(
                                      '####### ## #####',
                                      style: TextStyle(
                                        color: oController.colorLetraBase,
                                        fontSize: ScreenUtil.instance.setSp(25),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: height * .01),
                                    child: Text(
                                      '##,###',
                                      style: TextStyle(
                                        color: oController.colorLetraBase,
                                        fontSize: ScreenUtil.instance.setSp(25),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: height * .01, left: width * .01),
                                    child: Text(
                                      '## #.####,##',
                                      style: TextStyle(
                                        color: oController.colorLetraBase,
                                        fontSize: ScreenUtil.instance.setSp(25),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: height * .02,
                                    width: width * .18,
                                    margin: EdgeInsets.only(
                                        top: height * .01, left: width * .01),
                                    child: Text(
                                      '####### ## #####',
                                      style: TextStyle(
                                        color: oController.colorLetraBase,
                                        fontSize: ScreenUtil.instance.setSp(25),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: height * .01),
                                    child: Text(
                                      '##,###',
                                      style: TextStyle(
                                        color: oController.colorLetraBase,
                                        fontSize: ScreenUtil.instance.setSp(25),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: height * .01, left: width * .01),
                                    child: Text(
                                      '## #.####,##',
                                      style: TextStyle(
                                        color: oController.colorLetraBase,
                                        fontSize: ScreenUtil.instance.setSp(25),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          color: oController.colorRodape,
                          height: height * .1,
                          width: width,
                          child: Column(
                            children: [
                              Container(
                                height: height * .03,
                                width: width,
                                padding: EdgeInsets.only(
                                  top: height * .005,
                                ),
                                margin: EdgeInsets.only(
                                  top: height * .005,
                                ),
                                child: Center(
                                  child: Text(
                                    'Nome Empresa/Freelancer',
                                    style: TextStyle(
                                      color: oController.colorLetraRodape,
                                      fontSize: ScreenUtil.instance.setSp(25),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: height * .015,
                                width: width,
                                child: Center(
                                  child: Text(
                                    'Endereço',
                                    style: TextStyle(
                                      color: oController.colorLetraRodape,
                                      fontSize: ScreenUtil.instance.setSp(25),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: height * .015,
                                width: width,
                                child: Center(
                                  child: Text(
                                    'Telefone',
                                    style: TextStyle(
                                      color: oController.colorLetraRodape,
                                      fontSize: ScreenUtil.instance.setSp(25),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: height * .015,
                                width: width,
                                child: Center(
                                  child: Text(
                                    'Email',
                                    style: TextStyle(
                                      color: oController.colorLetraRodape,
                                      fontSize: ScreenUtil.instance.setSp(25),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                            height: height * .1,
                            width: width *.1,
                            margin: EdgeInsets.only(
                                bottom: height * .05, left: width * .003),
                            padding: EdgeInsets.only(
                                bottom: height * .05,
                              right: width *.025
                            ),
                            child: botoes('cabecalio')),
                        Container(
                            height: height * .1,
                            width: width *.1,
                            margin: EdgeInsets.only(
                              top: height *.080,
                                bottom: height * .010),
                            padding: EdgeInsets.only(
                                bottom: height * .05,
                                right: width *.025
                            ),
                            child: botoes('base')),
                        Container(
                            height: height * .1,
                            width: width *.1,
                            margin: EdgeInsets.only(
                              top: height * .060,
                            ),
                            padding: EdgeInsets.only(
                                bottom: height * .05,
                                right: width *.025
                            ),
                            child: botoes('rodape'))
                      ],
                    ),
                  ),
                ],
              );
            })
          ],
        ),
      ),
    );
  }

  Widget botoes(String nome) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.height;
    return Container(
      height: height * .08,
      width: width * .08,
      child: Material(
        child: Ink(
          child: CircleAvatar(
            backgroundColor: Colors.blue[900],
            child: RaisedButton(
              color: Colors.transparent,
              elevation: 0.0,
              onPressed: () {
                showAlertDialog1(context, nome);
              },
              child: Icon(
                Icons.edit,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  showAlertDialog1(BuildContext context, String nome) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return GetColor(nome: nome);
      },
    );
  }
}
