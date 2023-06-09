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
                  Flexible(
                    flex: 6,
                    child: Container(
                      margin: EdgeInsets.only(
                      left: width * .02,
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
                                    Flexible(
                                      flex: 1,
                                      child: Container(
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
                                    ),
                                    Flexible(
                                      flex: 2,
                                      child: Container(
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
                                    ),
                                    Flexible(
                                      flex: 2,
                                      child: Container(
                                        padding: EdgeInsets.only(
                                            top: height * .015,
                                            left: width * .03,
                                            right: width * .01),
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
                                    ),
                                  ],
                                ),
                                Container(
                                  height: height * .05,
                                  width: width,
                                  padding: EdgeInsets.only(
                                      top: height * .03, left: width * .02),
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
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Container(
                              height: height * .1,
                              width: width *.07,
                              margin: EdgeInsets.only(
                                  bottom: height * .05),
                              padding: EdgeInsets.only(
                                  bottom: height * .03,
                              ),
                              child: botoes('cabecalio')),
                          Container(
                              height: height * .1,
                              width: width *.07,
                              margin: EdgeInsets.only(
                                top: height *.080,
                                  bottom: height * .010),
                              padding: EdgeInsets.only(
                                  bottom: height * .03,
                              ),
                              child: botoes('base')),
                          Container(
                              height: height * .06,
                              width: width *.07,
                              margin: EdgeInsets.only(
                                top: height * .060,
                              ),
                              child: botoes('rodape'))
                        ],
                      ),
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
    return RaisedButton(
      color: Colors.transparent,
      elevation: 0.0,
      onPressed: () {
        showAlertDialog1(context, nome);
      },
      child: Icon(
        Icons.edit,
        color: Colors.blue[900],
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
