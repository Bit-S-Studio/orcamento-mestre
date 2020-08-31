import 'package:brasil_fields/formatter/real_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:orcamento_mestre/app/modules/dadosProjeto/projeto_controller.dart';
import 'package:orcamento_mestre/app/modules/orcamento/orcamento_controller.dart';
import 'package:provider/provider.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class ItemDescritionWidget extends StatefulWidget {
  @override
  _ItemDescritionWidgetState createState() => _ItemDescritionWidgetState();
}

class _ItemDescritionWidgetState extends State<ItemDescritionWidget> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.getInstance()..init(context);
    final controller = Provider.of<ProjetoController>(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.height;
    final oController = Provider.of<OrcamentoController>(context);
    return Container(
        height: height * 0.4,
        width: width,
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: Container(
                          height: height * .06,
                          child: Center(
                            child: TextFormField(
                              controller: controller.quantidadeController,
                              onChanged: controller.setQuantidade,
                              decoration: InputDecoration(
                                contentPadding: new EdgeInsets.symmetric(
                                    vertical: 05.0, horizontal: 10.0),
                                labelText: "Quantidade",
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
                            ),
                          )),
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                          height: height * .06,
                          margin: EdgeInsets.only(left: width * .005),
                          child: Center(
                            child: TextFormField(
                              controller: controller.medidaController,
                              onChanged: controller.changeMedida,
                              decoration: InputDecoration(
                                contentPadding: new EdgeInsets.symmetric(
                                    vertical: 05.0, horizontal: 10.0),
                                labelText: "Medida",
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
                            ),
                          )),
                    ),
                  ],
                ),
              ),
              Container(
                height: height * .06,
                margin: EdgeInsets.only(top: height * 0.005),
                child: Center(
                  child: TextFormField(
                    controller: controller.itemController,
                    onChanged: controller.changeDescricao,
                    decoration: InputDecoration(
                      contentPadding: new EdgeInsets.symmetric(
                          vertical: 05.0, horizontal: 10.0),
                      labelText: "Descrição do item*",
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
                      if (text.isEmpty)
                        return "O campo Descrição do ítem está vazio!";
                    },
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: height * 0.005),
                child: Row(
                  children: <Widget>[
                    Flexible(
                      flex: 1,
                      child: Container(
                        height: height * .06,
                        child: Center(
                          child: TextFormField(
                            controller: controller.valorController,
                            onChanged: controller.setValor,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              RealInputFormatter(centavos: true)
                            ],
                            decoration: InputDecoration(
                              contentPadding: new EdgeInsets.symmetric(
                                  vertical: 05.0, horizontal: 10.0),
                              labelText: "R\$ 0.000,00*",
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
                              if (text.isEmpty)
                                return "O campo Valor está vazio!";
                            },
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                          height: height * .06,
                          margin: EdgeInsets.only(left: width * .005),
                          child: Center(
                            child: TextFormField(
                              controller: controller.tempoController,
                              onChanged: controller.changeTempo,
                              decoration: InputDecoration(
                                contentPadding: new EdgeInsets.symmetric(
                                    vertical: 05.0, horizontal: 10.0),
                                labelText: "Tempo",
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
                            ),
                          )),
                    ),
                    Observer(builder: (_) {
                      return Flexible(
                        flex: 1,
                        child: Container(
                            height: height * .06,
                            padding: EdgeInsets.only(
                              top: height *.018,
                                left: width * .01),
                            child: Text(
                              'R\$ ${controller.valorTotal.toStringAsFixed(2)}',
                              style: TextStyle(
                                color: Colors.blue[900],
                                fontSize: ScreenUtil.instance.setSp(40),
                                fontWeight: FontWeight.bold
                              ),
                            ),),
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
