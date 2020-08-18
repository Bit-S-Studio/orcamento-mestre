import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'layout_controller.dart';

class LayoutPage extends StatefulWidget {
  final String title;
  const LayoutPage({Key key, this.title = "Layout"}) : super(key: key);

  @override
  _LayoutPageState createState() => _LayoutPageState();
}

class _LayoutPageState extends ModularState<LayoutPage, LayoutController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    ScreenUtil.getInstance()..init(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Row(
          children: [
            Container(
              height: height,
              width: width *.36,
              margin: EdgeInsets.only(
                left: width *.07,
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    color: Colors.grey[800],
                    height: height *.1,
                    width: width,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              height: height *.05,
                              width: width *.05,
                              padding: EdgeInsets.only(
                                top: height *.015,
                              ),
                              child: Center(
                                child: Text('Logo',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: ScreenUtil.instance.setSp(35),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: height *.05,
                              width: width *.11,
                              padding: EdgeInsets.only(
                                  top: height *.015,
                                left: width *.005
                              ),
                              child: Center(
                                child: Text('Nome Empresa',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: ScreenUtil.instance.setSp(25),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: height *.05,
                              width: width *.2,
                              padding: EdgeInsets.only(
                                top: height *.015,
                                  left: width *.03,
                                right: width *.005
                              ),
                              child: Center(
                                child: Text('Descrição/resumo do orçamento',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: ScreenUtil.instance.setSp(25),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: height *.05,
                          width: width,
                          padding: EdgeInsets.only(
                            top: height *.03,
                            left: width *.32
                          ),
                          child: Text('Data',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: ScreenUtil.instance.setSp(25),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.blueGrey,
                    height: height *.3,
                    width: width,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              height: height *.02,
                              width: width *.18,
                              margin: EdgeInsets.only(
                                top: height *.01,
                                left: width *.01
                              ),
                              child: Text('####### ## #####',
                                style: TextStyle(
                                  fontSize: ScreenUtil.instance.setSp(25),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  top: height *.01
                              ),
                              child: Text('##,###',
                                style: TextStyle(
                                  fontSize: ScreenUtil.instance.setSp(25),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  top: height *.01,
                                left: width *.01
                              ),
                              child: Text('## #.####,##',
                                style: TextStyle(
                                  fontSize: ScreenUtil.instance.setSp(25),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              height: height *.02,
                              width: width *.18,
                              margin: EdgeInsets.only(
                                  top: height *.01,
                                  left: width *.01
                              ),
                              child: Text('####### ## #####',
                                style: TextStyle(
                                  fontSize: ScreenUtil.instance.setSp(25),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  top: height *.01
                              ),
                              child: Text('##,###',
                                style: TextStyle(
                                  fontSize: ScreenUtil.instance.setSp(25),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  top: height *.01,
                                  left: width *.01
                              ),
                              child: Text('## #.####,##',
                                style: TextStyle(
                                  fontSize: ScreenUtil.instance.setSp(25),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              height: height *.02,
                              width: width *.18,
                              margin: EdgeInsets.only(
                                  top: height *.01,
                                  left: width *.01
                              ),
                              child: Text('####### ## #####',
                                style: TextStyle(
                                  fontSize: ScreenUtil.instance.setSp(25),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  top: height *.01
                              ),
                              child: Text('##,###',
                                style: TextStyle(
                                  fontSize: ScreenUtil.instance.setSp(25),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  top: height *.01,
                                  left: width *.01
                              ),
                              child: Text('## #.####,##',
                                style: TextStyle(
                                  fontSize: ScreenUtil.instance.setSp(25),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              height: height *.02,
                              width: width *.18,
                              margin: EdgeInsets.only(
                                  top: height *.01,
                                  left: width *.01
                              ),
                              child: Text('####### ## #####',
                                style: TextStyle(
                                  fontSize: ScreenUtil.instance.setSp(25),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  top: height *.01
                              ),
                              child: Text('##,###',
                                style: TextStyle(
                                  fontSize: ScreenUtil.instance.setSp(25),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  top: height *.01,
                                  left: width *.01
                              ),
                              child: Text('## #.####,##',
                                style: TextStyle(
                                  fontSize: ScreenUtil.instance.setSp(25),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              height: height *.02,
                              width: width *.18,
                              margin: EdgeInsets.only(
                                  top: height *.01,
                                  left: width *.01
                              ),
                              child: Text('####### ## #####',
                                style: TextStyle(
                                  fontSize: ScreenUtil.instance.setSp(25),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  top: height *.01
                              ),
                              child: Text('##,###',
                                style: TextStyle(
                                  fontSize: ScreenUtil.instance.setSp(25),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  top: height *.01,
                                  left: width *.01
                              ),
                              child: Text('## #.####,##',
                                style: TextStyle(
                                  fontSize: ScreenUtil.instance.setSp(25),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              height: height *.02,
                              width: width *.18,
                              margin: EdgeInsets.only(
                                  top: height *.01,
                                  left: width *.01
                              ),
                              child: Text('####### ## #####',
                                style: TextStyle(
                                  fontSize: ScreenUtil.instance.setSp(25),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  top: height *.01
                              ),
                              child: Text('##,###',
                                style: TextStyle(
                                  fontSize: ScreenUtil.instance.setSp(25),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  top: height *.01,
                                  left: width *.01
                              ),
                              child: Text('## #.####,##',
                                style: TextStyle(
                                  fontSize: ScreenUtil.instance.setSp(25),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              height: height *.02,
                              width: width *.18,
                              margin: EdgeInsets.only(
                                  top: height *.01,
                                  left: width *.01
                              ),
                              child: Text('####### ## #####',
                                style: TextStyle(
                                  fontSize: ScreenUtil.instance.setSp(25),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  top: height *.01
                              ),
                              child: Text('##,###',
                                style: TextStyle(
                                  fontSize: ScreenUtil.instance.setSp(25),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  top: height *.01,
                                  left: width *.01
                              ),
                              child: Text('## #.####,##',
                                style: TextStyle(
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
                    color: Colors.grey[800],
                    height: height *.1,
                    width: width,
                    child: Column(
                      children: [
                        Container(
                          height: height *.03,
                          width: width,
                          padding: EdgeInsets.only(
                              top: height *.005,
                          ),
                          margin: EdgeInsets.only(
                            top: height *.005,
                          ),
                          child: Center(
                            child: Text('Nome Empresa/Freelancer',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: ScreenUtil.instance.setSp(25),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: height *.015,
                          width: width,
                          child: Center(
                            child: Text('Endereço',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: ScreenUtil.instance.setSp(25),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: height *.015,
                          width: width,
                          child: Center(
                            child: Text('Telefone',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: ScreenUtil.instance.setSp(25),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: height *.015,
                          width: width,
                          child: Center(
                            child: Text('Email',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: ScreenUtil.instance.setSp(25),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: height *.3,
                    width: width,
                    padding: EdgeInsets.only(
                      top: height *.045
                    ),
                    child: Text(
                      'Personalize seu orçamento',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: ScreenUtil.instance.setSp(45),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: height *1,
              width: width *.05,
              child: Column(
                children: [
                  Container(
                    height: height *.1,
                    width: width,
                    padding: EdgeInsets.only(
                      left: width *.003
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: Ink(
                        decoration: const ShapeDecoration(
                            color: Colors.grey,
                            shape: CircleBorder()),
                        child: IconButton(
                          icon: Icon(Icons.edit,
                            size: 18,
                          ),
                          color: Colors.blue[900],
                          onPressed: (){},
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: height *.3,
                    width: width,
                    padding: EdgeInsets.only(
                        left: width *.003
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: Ink(
                        decoration: const ShapeDecoration(
                            color: Colors.grey,
                            shape: CircleBorder()),
                        child: IconButton(
                          icon: Icon(Icons.edit,
                            size: 18,
                          ),
                          color: Colors.blue[900],
                          onPressed: (){},
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: height *.1,
                    width: width,
                    padding: EdgeInsets.only(
                        left: width *.003
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: Ink(
                        decoration: const ShapeDecoration(
                            color: Colors.grey,
                            shape: CircleBorder()),
                        child: IconButton(
                          icon: Icon(Icons.edit,
                            size: 18,
                          ),
                          color: Colors.blue[900],
                          onPressed: (){},
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
    );
  }
}
