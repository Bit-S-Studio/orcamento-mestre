import 'package:firebase_admob/firebase_admob.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:orcamento_mestre/app/modules/base/base_controller.dart';
import 'package:orcamento_mestre/app/modules/clientes/clientes_controller.dart';
import 'package:orcamento_mestre/app/modules/dadosProjeto/projeto_controller.dart';
import 'package:orcamento_mestre/app/modules/login/register/register_controller.dart';
import 'package:orcamento_mestre/app/modules/orcamento/orcamento_controller.dart';
import 'package:orcamento_mestre/app/modules/pdf/pdf_controller.dart';
import 'package:orcamento_mestre/app/modules/perfil/perfil_controller.dart';
import 'package:orcamento_mestre/app/utils/customHasuraConnect.dart';
import 'package:orcamento_mestre/app/utils/dados_controller.dart';
import 'package:orcamento_mestre/app/utils/servicos_controller.dart';
import 'package:orcamento_mestre/app/utils/users/user_controller.dart';
import 'package:provider/provider.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<OrcamentoController>(create: (_) => OrcamentoController()),
        Provider<BaseController>(create: (_) => BaseController()),
        Provider<ProjetoController>(create: (_) => ProjetoController()),
        Provider<PdfController>(create: (_) => PdfController()),
        Provider<RegisterController>(create: (_) => RegisterController()),
        Provider<UserController>(create: (_) => UserController()),
        Provider<ServicosController>(create: (_) => ServicosController()),
        Provider<PerfilController>(create: (_) => PerfilController()),
        Provider<CustomHasuraConnect>(create: (_) => CustomHasuraConnect()),
        Provider<ClientesController>(
            create: (_) => ClientesController(
                CustomHasuraConnect.getConnect(FirebaseAuth.instance))),
        Provider<DadosController>(
            create: (_) => DadosController(
                CustomHasuraConnect.getConnect(FirebaseAuth.instance))),
      ],
      child: MaterialApp(
        navigatorKey: Modular.navigatorKey,
        title: 'Flutter Slidy',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        onGenerateRoute: Modular.generateRoute,
      ),
    );
  }
}
