import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:orcamento_mestre/app/modules/dadosProjeto/Consts.dart';
import 'package:orcamento_mestre/app/modules/dadosProjeto/item_description_widget.dart';
import 'package:orcamento_mestre/app/modules/dadosProjeto/projeto_controller.dart';
import 'package:provider/provider.dart';

class AddItem extends StatefulWidget {
  @override
  _AddItemState createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.height;
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Consts.padding),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: Container(
          height: height * .53, width: width, child: dialogContent(context)),
    );
  }

  Widget dialogContent(BuildContext context) {
    ScreenUtil.getInstance()..init(context);
    final controller = Provider.of<ProjetoController>(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Container(
        height: height * .47,
        padding: EdgeInsets.only(
          top: height * .01,
          bottom: height * .01,
          left: width * .01,
          right: width * .01,
        ),
        decoration: new BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(Consts.avatarRadius),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              offset: const Offset(0.0, 10.0),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: width * .13,
                  child: Center(
                    child: Text(
                      'Novo Item',
                      style: TextStyle(
                          color: Colors.blue[900],
                          fontSize: ScreenUtil.instance.setSp(40),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Flexible(fit: FlexFit.tight, child: SizedBox()),
                IconButton(
                    icon: Icon(
                      Icons.close,
                      color: Colors.blue[900],
                    ),
                    onPressed: () {
                      Modular.to.pop();
                    }),
              ],
            ),
            Container(
              height: height * .06,
              child: TextFormField(
                onChanged: controller.changeCategoria,
                controller: controller.categoriaController,
                decoration: InputDecoration(
                  contentPadding: new EdgeInsets.symmetric(
                      vertical: 05.0, horizontal: 10.0),
                  labelText: "Categoria",
                  labelStyle: TextStyle(
                      color: Colors.blue,
                    fontSize: ScreenUtil.instance.setSp(25),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                        const Radius.circular(12.0)),
                    borderSide: BorderSide(
                        color: Colors.grey[500], width: 2.0
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                        const Radius.circular(12.0)),
                    borderSide: BorderSide(
                        color: Colors.blue[900], width: 3.0
                    ),
                  ),
                ),
                validator: (text) {
                  if (text.isEmpty) return "O campo Categoria está vazio!";
                },
              ),
            ),
            Container(height: height * .2, child: ItemDescritionWidget()),
            Container(
                margin: EdgeInsets.only(top: height * .02), child: button())
          ],
        ),
      ),
    );
  }

  Widget button() {
    ScreenUtil.getInstance()..init(context);
    final controller = Provider.of<ProjetoController>(context);
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height * .08,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            color: Colors.blue[900]),
        child: MaterialButton(
          onPressed: () async {
            if (controller.categoria == null ||
                controller.descricao == null ||
                controller.valor == null) {
              Fluttertoast.showToast(
                  msg: 'Por favor preencha os dados obrigatórios');
            } else {
              controller.setItem();
            }
          },
          highlightColor: Colors.transparent,
          splashColor: Colors.white,
          child: Container(
            child: Text(
              "Salvar",
              style: TextStyle(
                color: Colors.white,
                fontSize: ScreenUtil.instance.setSp(75),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
