import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
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
  Color pickerColor = Color(0xff443a49);
  Color currentColor = Color(0xff443a49);

  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    ScreenUtil.getInstance()..init(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: height * .1,
              width: width *.3,
              padding: EdgeInsets.only(top: height * .02),
              child: Text(
                'Personalize as cores do seu orçamento',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: ScreenUtil.instance.setSp(45),
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            Row(
              children: [
                Container(
                  height: height,
                  width: width * .36,
                  margin: EdgeInsets.only(
                    left: width * .03,
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        color: Colors.grey[800],
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
                                        color: Colors.white,
                                        fontSize: ScreenUtil.instance.setSp(35),
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
                                        color: Colors.white,
                                        fontSize: ScreenUtil.instance.setSp(25),
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
                                        color: Colors.white,
                                        fontSize: ScreenUtil.instance.setSp(25),
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
                                      fontSize: ScreenUtil.instance.setSp(25),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: height * .01),
                                  child: Text(
                                    '##,###',
                                    style: TextStyle(
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
                                      fontSize: ScreenUtil.instance.setSp(25),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: height * .01),
                                  child: Text(
                                    '##,###',
                                    style: TextStyle(
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
                                      fontSize: ScreenUtil.instance.setSp(25),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: height * .01),
                                  child: Text(
                                    '##,###',
                                    style: TextStyle(
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
                                      fontSize: ScreenUtil.instance.setSp(25),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: height * .01),
                                  child: Text(
                                    '##,###',
                                    style: TextStyle(
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
                                      fontSize: ScreenUtil.instance.setSp(25),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: height * .01),
                                  child: Text(
                                    '##,###',
                                    style: TextStyle(
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
                                      fontSize: ScreenUtil.instance.setSp(25),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: height * .01),
                                  child: Text(
                                    '##,###',
                                    style: TextStyle(
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
                                      fontSize: ScreenUtil.instance.setSp(25),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: height * .01),
                                  child: Text(
                                    '##,###',
                                    style: TextStyle(
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
                                    color: Colors.white,
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
                                    color: Colors.white,
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
                                    color: Colors.white,
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
                                    color: Colors.white,
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
                  height: height * 1,
                  width: width * .1,
                  child: Column(
                    children: [
                      Container(
                        height: height * .08,
                        width: width *.08,
                        padding: EdgeInsets.only(left: width * .003),
                        child: Material(
                          child: Ink(
                            decoration: const ShapeDecoration(
                                color: Colors.transparent, shape: CircleBorder()),
                            child: RaisedButton(
                              color: Colors.blue[900],
                              elevation: 3.0,
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      titlePadding: const EdgeInsets.all(0.0),
                                      contentPadding: const EdgeInsets.all(0.0),
                                      content: SingleChildScrollView(
                                        child: ColorPicker(
                                          pickerColor: currentColor,
                                          onColorChanged: changeColor,
                                          colorPickerWidth: 300.0,
                                          pickerAreaHeightPercent: 0.7,
                                          enableAlpha: true,
                                          displayThumbColor: true,
                                          showLabel: true,
                                          paletteType: PaletteType.hsv,
                                          pickerAreaBorderRadius: const BorderRadius.only(
                                            topLeft: const Radius.circular(2.0),
                                            topRight: const Radius.circular(2.0),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                              child: Icon(Icons.edit),
                              //color: currentColor,
                              textColor: useWhiteForeground(currentColor)
                                  ? const Color(0xffffffff)
                                  : const Color(0xff000000),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: height * .08,
                        width: width *.08,
                        margin: EdgeInsets.only(
                          top: height *.12,
                            bottom: height *.12,
                            left: width * .003,
                        ),
                        child: Material(
                          child: Ink(
                            decoration: const ShapeDecoration(
                                color: Colors.transparent, shape: CircleBorder()),
                            child: RaisedButton(
                              color: Colors.blue[900],
                              elevation: 3.0,
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      titlePadding: const EdgeInsets.all(0.0),
                                      contentPadding: const EdgeInsets.all(0.0),
                                      content: SingleChildScrollView(
                                        child: ColorPicker(
                                          pickerColor: currentColor,
                                          onColorChanged: changeColor,
                                          colorPickerWidth: 300.0,
                                          pickerAreaHeightPercent: 0.7,
                                          enableAlpha: true,
                                          displayThumbColor: true,
                                          showLabel: true,
                                          paletteType: PaletteType.hsv,
                                          pickerAreaBorderRadius: const BorderRadius.only(
                                            topLeft: const Radius.circular(2.0),
                                            topRight: const Radius.circular(2.0),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                              child: Icon(Icons.edit,
                              ),
                              //color: currentColor,
                              textColor: useWhiteForeground(currentColor)
                                  ? const Color(0xffffffff)
                                  : const Color(0xff000000),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: height * .08,
                        width: width *.08,
                        padding: EdgeInsets.only(
                            left: width * .003,
                        ),
                        child: Material(
                          child: Ink(
                            decoration: const ShapeDecoration(
                                color: Colors.transparent, shape: CircleBorder()),
                            child: RaisedButton(
                              color: Colors.blue[900],
                              elevation: 3.0,
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      titlePadding: const EdgeInsets.all(0.0),
                                      contentPadding: const EdgeInsets.all(0.0),
                                      content: SingleChildScrollView(
                                        child: ColorPicker(
                                          pickerColor: currentColor,
                                          onColorChanged: changeColor,
                                          colorPickerWidth: 300.0,
                                          pickerAreaHeightPercent: 0.7,
                                          enableAlpha: true,
                                          displayThumbColor: true,
                                          showLabel: true,
                                          paletteType: PaletteType.hsv,
                                          pickerAreaBorderRadius: const BorderRadius.only(
                                            topLeft: const Radius.circular(2.0),
                                            topRight: const Radius.circular(2.0),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                              child: Icon(Icons.edit),
                              //color: currentColor,
                              textColor: useWhiteForeground(currentColor)
                                  ? const Color(0xffffffff)
                                  : const Color(0xff000000),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
