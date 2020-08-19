import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:orcamento_mestre/app/modules/layout/layout_controller.dart';
import 'package:orcamento_mestre/app/modules/orcamento/orcamento_controller.dart';
import 'package:provider/provider.dart';

class GetColor extends StatefulWidget {
  final String nome;

  const GetColor({Key key, this.nome}) : super(key: key);

  @override
  _GetColorState createState() => _GetColorState();
}

class _GetColorState extends State<GetColor> {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<LayoutController>(context);
    final oController = Provider.of<OrcamentoController>(context);
    return AlertDialog(
      title: const Text('Escolha uma cor!'),
      content: SingleChildScrollView(
        child: Column(
          children: [
            Observer(builder: (_) {
              return ColorPicker(
                  pickerColor: controller.pickerColor,
                  onColorChanged: controller.changeColor,
                  showLabel: true,
                  pickerAreaHeightPercent: 0.8,
                  colorPickerWidth: 300.0,
                  enableAlpha: true,
                  displayThumbColor: true,
                  paletteType: PaletteType.hsv,
                  pickerAreaBorderRadius: const BorderRadius.only(
                      topLeft: const Radius.circular(2.0),
                      topRight: const Radius.circular(2.0)));
            }),
            Observer(builder: (_) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Texto: '),
                  Checkbox(
                      value: oController.letraPreta,
                      onChanged: (bool value) {
                        oController.letraPreta = true;
                        oController.letraBranca = false;
                        oController.corLetra = 'Preta';
                      }),
                  CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.black,
                  ),
                  Checkbox(
                      value: oController.letraBranca,
                      onChanged: (bool value) {
                        oController.letraPreta = false;
                        oController.letraBranca = true;
                        oController.corLetra = 'Branca';
                      }),
                  CircleAvatar(
                      radius: 10,
                      backgroundColor: Colors.black,
                      child: CircleAvatar(
                          radius: 9, backgroundColor: Colors.white))
                ],
              );
            }),
            button()
          ],
        ),
      ),
    );
  }

  Widget button() {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.height;
    final controller = Provider.of<LayoutController>(context);
    final oController = Provider.of<OrcamentoController>(context);
    return Observer(builder: (_) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.blue[900],
          borderRadius: BorderRadius.all(Radius.circular(12)),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black,
              offset: Offset(1.0, 6.0),
              blurRadius: 20.0,
            ),
          ],
        ),
        child: MaterialButton(
            onPressed: () async {
              oController.convertColor(
                  controller.pickerColor, widget.nome, oController.corLetra);
              Navigator.of(context).pop();
            },
            highlightColor: Colors.transparent,
            splashColor: Colors.black,
            //shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
            child: Container(
              width: width * .2,
              child: Text(
                "Salvar Cores",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
            )),
      );
    });
  }
}
