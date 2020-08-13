import 'package:flutter/material.dart';
import 'package:orcamento_mestre/app/modules/dadosEmpresa/dadosEmpresa_page.dart';
import 'package:orcamento_mestre/app/modules/dadosFreelancer/dadosFreelancer_page.dart';
import 'package:orcamento_mestre/app/modules/login/register/register_controller.dart';
import 'package:provider/provider.dart';

class DadosRegister extends StatefulWidget {
  @override
  _DadosRegisterState createState() => _DadosRegisterState();
}

class _DadosRegisterState extends State<DadosRegister> {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<RegisterController>(context);
    return Scaffold(
      body: (controller.tipo == 'Empresa')
          ? DadosEmpresaPage()
          : DadosFreelancerPage(),
    );
  }
}
