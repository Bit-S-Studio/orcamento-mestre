import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'empresa_controller.dart';

class DadosEmpresaPage extends StatefulWidget {
  final String title;

  const DadosEmpresaPage({Key key, this.title = "DadosEmpresa"})
      : super(key: key);

  @override
  _DadosEmpresaPageState createState() => _DadosEmpresaPageState();
}

class _DadosEmpresaPageState
    extends ModularState<DadosEmpresaPage, EmpresaController> {
  final _nameEmpresa = TextEditingController();
  final _nameLogradouro = TextEditingController();

  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              Container(
                color: Colors.white,
                height: height *.30,
                width: width,
                child: Center(
                  child: Text(
                    'Espaço para Admob',
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                ),
              ),
              Container(
                height: height * .28,
                width: width,
                margin: EdgeInsets.only(
                  top: height * .025,
                ),
                decoration: BoxDecoration(
                    color: Colors.blue[900],
                    borderRadius: BorderRadius.only(
                        topLeft:  Radius.circular(16),
                        topRight:  Radius.circular(16)
                    )
                ),
                child: Center(
                  child: Row(
                    children: [
                      Container(
                        height: height * .15,
                        width: width * .15,
                        decoration: BoxDecoration(
                            color: Colors.grey[600],
                            borderRadius:
                                BorderRadius.all(Radius.circular(16))),
                        margin: EdgeInsets.only(left: width * .02),
                        child: Center(
                          child: Text(
                            'Adicione sua Logo aqui',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      Container(
                        height: height * .06,
                        width: width * .35,
                        margin: EdgeInsets.only(
                          left: width * .012,
                        ),
                        child: TextFormField(
                          controller: _nameEmpresa,
                          decoration: InputDecoration(
                            contentPadding: new EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 10.0),
                            labelText: "Nome",
                            border: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                  const Radius.circular(12.0)),
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
                    ],
                  ),
                ),
              ),
              Container(
                height: height *.56,
                width: width,
                margin: EdgeInsets.only(
                  top: height *.005
                ),
                decoration: BoxDecoration(
                    color: Colors.blue[900],
                    borderRadius: BorderRadius.only(
                        bottomLeft:  Radius.circular(16),
                        bottomRight:  Radius.circular(16)
                    )
                ),
                child: Column(
                  children: [
                    Container(
                      height: height *.05,
                      width: width,
                      padding: EdgeInsets.only(
                        top: height *.008,
                        left: width *.01
                      ),
                      child: Text('Complementos',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          height: height *.07,
                          width: width *.395,
                          padding: EdgeInsets.only(
                            top: height *.006,
                            bottom: height *.006,
                            left: width *.014,
                            right: width *.004,
                          ),
                          child: TextFormField(
                            controller: _nameLogradouro,
                            decoration: InputDecoration(
                              contentPadding: new EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 10.0),
                              labelText: "Logradouro",
                              border: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                    const Radius.circular(12.0)),
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            validator: (text) {
                              if (text.isEmpty) return "O campo Lagradouro, está vazio";
                            },
                          ),
                        ),
                        Container(
                          height: height *.07,
                          width: width *.16,
                          padding: EdgeInsets.only(
                            top: height *.006,
                            bottom: height *.006,
                            left: width *.008,
                            right: width *.014,
                          ),
                          child: TextFormField(
                            controller: _nameLogradouro,
                            decoration: InputDecoration(
                              contentPadding: new EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 10.0),
                              labelText: "Número",
                              border: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                    const Radius.circular(12.0)),
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            validator: (text) {
                              if (text.isEmpty) return "O campo Lagradouro, está vazio";
                            },
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: height *.07,
                      width: width,
                      padding: EdgeInsets.only(
                        top: height *.006,
                        bottom: height *.006,
                        left: width *.014,
                        right: width *.014,
                      ),
                      child: TextFormField(
                        controller: _nameLogradouro,
                        decoration: InputDecoration(
                          contentPadding: new EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                          labelText: "Bairro",
                          border: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                                const Radius.circular(12.0)),
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        validator: (text) {
                          if (text.isEmpty) return "O campo Lagradouro, está vazio";
                        },
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          height: height *.07,
                          width: width *.395,
                          padding: EdgeInsets.only(
                            top: height *.006,
                            bottom: height *.006,
                            left: width *.014,
                            right: width *.004,
                          ),
                          child: TextFormField(
                            controller: _nameLogradouro,
                            decoration: InputDecoration(
                              contentPadding: new EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 10.0),
                              labelText: "Cidade",
                              border: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                    const Radius.circular(12.0)),
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            validator: (text) {
                              if (text.isEmpty) return "O campo Lagradouro, está vazio";
                            },
                          ),
                        ),
                        Container(
                          height: height *.07,
                          width: width *.16,
                          padding: EdgeInsets.only(
                            top: height *.006,
                            bottom: height *.006,
                            left: width *.008,
                            right: width *.014,
                          ),
                          child: TextFormField(
                            controller: _nameLogradouro,
                            decoration: InputDecoration(
                              contentPadding: new EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 10.0),
                              labelText: "UF",
                              border: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                    const Radius.circular(12.0)),
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            validator: (text) {
                              if (text.isEmpty) return "O campo Lagradouro, está vazio";
                            },
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          height: height *.07,
                          width: width *.275,
                          padding: EdgeInsets.only(
                            top: height *.006,
                            bottom: height *.006,
                            left: width *.014,
                            right: width *.004,
                          ),
                          child: TextFormField(
                            controller: _nameLogradouro,
                            decoration: InputDecoration(
                              contentPadding: new EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 10.0),
                              labelText: "Celular 1",
                              border: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                    const Radius.circular(12.0)),
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            validator: (text) {
                              if (text.isEmpty) return "O campo Lagradouro, está vazio";
                            },
                          ),
                        ),
                        Container(
                          height: height *.07,
                          width: width *.275,
                          padding: EdgeInsets.only(
                            top: height *.006,
                            bottom: height *.006,
                            left: width *.008,
                            right: width *.014,
                          ),
                          child: TextFormField(
                            controller: _nameLogradouro,
                            decoration: InputDecoration(
                              contentPadding: new EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 10.0),
                              labelText: "Celular 2",
                              border: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                    const Radius.circular(12.0)),
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            validator: (text) {
                              if (text.isEmpty) return "O campo Lagradouro, está vazio";
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
