import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:orcamento_mestre/app/modules/clientes/clientes_controller.dart';
import 'package:orcamento_mestre/app/modules/pdf/pdf_controller.dart';
import 'package:orcamento_mestre/app/utils/dados_controller.dart';
import 'package:provider/provider.dart';
import 'orcamento_controller.dart';

class OrcamentoPage extends StatefulWidget {
  final String title;
  const OrcamentoPage({Key key, this.title = "Orcamento"}) : super(key: key);

  @override
  _OrcamentoPageState createState() => _OrcamentoPageState();
}

class _OrcamentoPageState extends State<OrcamentoPage> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    final pdfController = Provider.of<PdfController>(context);
    final controller = Provider.of<OrcamentoController>(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              height: height * .06,
              margin: EdgeInsets.only(
                top: height * .015,
              ),
              child: TextFormField(
                controller: controller.nomeController,
                onChanged: (newNome) {
                  controller.nome = newNome;
                },
                decoration: InputDecoration(
                  contentPadding: new EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 10.0),
                  labelText: "Nome do orçamento",
                  border: OutlineInputBorder(
                    borderRadius:
                        const BorderRadius.all(const Radius.circular(12.0)),
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                ),
                validator: (text) {
                  if (text.isEmpty) return "O campo nome, está vazio";
                },
              ),
            ),
            Container(
              height: 204,
              margin: EdgeInsets.only(
                top: height * .015,
              ),
              child: TextFormField(
                maxLines: 6,
                controller: controller.observacaoController,
                onChanged: (newObs) {
                  controller.observacao = newObs;
                },
                decoration: InputDecoration(
                  contentPadding: new EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 10.0),
                  labelText: "Observação",
                  border: OutlineInputBorder(
                    borderRadius:
                        const BorderRadius.all(const Radius.circular(12.0)),
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            button()
          ],
        ));
  }

  Widget button() {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.height;
    final pdfController = Provider.of<PdfController>(context);
    final controller = Provider.of<OrcamentoController>(context);
    final dadosController = Provider.of<DadosController>(context);
    final clienteController = Provider.of<ClientesController>(context);
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
              if (dadosController.imgUrl == null) {
                dadosController.imgUrl = '';
              }
              pdfController.writeOnPdf(
                  colorCabecalio: controller.cabecalio,
                  colorBase: controller.base,
                  colorRodape: controller.rodape,
                  colorLetraCabecalio: controller.letraCabecalio,
                  colorLetraBase: controller.letraBase,
                  colorLetraRodape: controller.letraRodape,
                  nomeEmpresa: dadosController.nome,
                  emailEmpresa: dadosController.email,
                  telefoneEmpresa: dadosController.telefone1,
                  enderecoEmpresa: dadosController.endereco,
                  numeroEmpresa: dadosController.numero,
                  cidadeEmpresa: dadosController.cidade,
                  ufEmpresa: dadosController.uf,
                  logo: dadosController.imgUrl,
                  nomeCliente: clienteController.nome);

              await pdfController.savePdf(controller.nome);
            },
            highlightColor: Colors.transparent,
            splashColor: Colors.black,
            //shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
            child: Container(
              width: width * .2,
              child: Text(
                "Finalizar Orçamento",
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
