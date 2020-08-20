import 'package:brasil_fields/formatter/real_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
                                    vertical: 10.0, horizontal: 10.0),
                                labelText: "Quantidade",
                                labelStyle: TextStyle(
                                  fontSize: ScreenUtil.instance.setSp(25),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                      const Radius.circular(12.0)),
                                  borderSide: BorderSide(
                                    color: Colors.white,
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
                                    vertical: 10.0, horizontal: 10.0),
                                labelText: "Medida",
                                labelStyle: TextStyle(
                                  fontSize: ScreenUtil.instance.setSp(25),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                      const Radius.circular(12.0)),
                                  borderSide: BorderSide(
                                    color: Colors.white,
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
                          vertical: 10.0, horizontal: 10.0),
                      labelText: "Descrição do Ítem*",
                      labelStyle: TextStyle(
                        fontSize: ScreenUtil.instance.setSp(25),
                      ),
                      border: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(const Radius.circular(12.0)),
                        borderSide: BorderSide(
                          color: Colors.white,
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
                                  vertical: 10.0, horizontal: 10.0),
                              labelText: "R\$ 0.000,00*",
                              labelStyle: TextStyle(
                                fontSize: ScreenUtil.instance.setSp(25),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                    const Radius.circular(12.0)),
                                borderSide: BorderSide(
                                  color: Colors.white,
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
                                    vertical: 10.0, horizontal: 10.0),
                                labelText: "Tempo",
                                labelStyle: TextStyle(
                                  fontSize: ScreenUtil.instance.setSp(25),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                      const Radius.circular(12.0)),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
