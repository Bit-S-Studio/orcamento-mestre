import 'package:circle_bottom_navigation/circle_bottom_navigation.dart';
import 'package:circle_bottom_navigation/widgets/tab_data.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:orcamento_mestre/app/modules/clientes/clientes_controller.dart';
import 'package:orcamento_mestre/app/modules/clientes/clientes_page.dart';
import 'package:orcamento_mestre/app/modules/dadosProjeto/addItem.dart';
import 'package:orcamento_mestre/app/modules/dadosProjeto/dadosProjeto_module.dart';
import 'package:orcamento_mestre/app/modules/dadosProjeto/projeto_controller.dart';
import 'package:orcamento_mestre/app/modules/layout/layout_module.dart';
import 'package:orcamento_mestre/app/modules/orcamento/orcamento_module.dart';
import 'package:orcamento_mestre/app/modules/tipo/tipo_module.dart';
import 'package:orcamento_mestre/app/utils/users/user_controller.dart';
import 'package:provider/provider.dart';
import 'base_controller.dart';

class BasePage extends StatefulWidget {
  final String title;
  const BasePage({Key key, this.title = "Base"}) : super(key: key);

  @override
  _BasePageState createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  List widgetOptions = [
    TipoModule(),
    ClientesPage(),
    DadosProjetoModule(),
    LayoutModule(),
    OrcamentoModule(),
  ];

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<BaseController>(context);
    final projetoController = Provider.of<ProjetoController>(context);
    return Stack(
      children: [
        background(),
        Scaffold(
            backgroundColor: Colors.transparent,
            body: Observer(builder: (_) {
              return page();
            }),
            bottomNavigationBar: bottomNav(),
            floatingActionButton: floation()),
      ],
    );
  }

  Widget background() {
    return Center(
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.blue[900], Colors.grey[800]])),
        child: Center(
          child: Text(''),
        ),
      ),
    );
  }

  Widget page() {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.height;
    final controller = Provider.of<BaseController>(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: height * 0.08,
          ),
          SizedBox(
            height: height * 0.02,
            child: FractionallySizedBox(
              widthFactor: 1,
              alignment: Alignment.topRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      icon: Icon(
                        LineAwesomeIcons.bell_o,
                        color: Colors.white,
                      ),
                      onPressed: () {}),
                  IconButton(
                      icon: Icon(
                        LineAwesomeIcons.comments_o,
                        color: Colors.white,
                      ),
                      onPressed: () {}),
                  IconButton(
                      icon: Icon(
                        LineAwesomeIcons.cog,
                        color: Colors.white,
                      ),
                      onPressed: () {}),
                  SizedBox(
                    width: width * 0.04,
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24.0),
            child: SizedBox(
              height: height * 0.1,
              child: FractionallySizedBox(
                alignment: Alignment.topLeft,
                widthFactor: 0.5,
                child: Observer(builder: (_) {
                  return Text(
                    controller.nomePage,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                    ),
                    textAlign: TextAlign.left,
                  );
                }),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: height * .01,
              left: width * .01,
              right: width * .01,
            ),
            child: Container(
              height: height * 0.66,
              width: width,
              margin: EdgeInsets.only(left: 18, right: 18),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24), color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Observer(builder: (_) {
                  return widgetOptions.elementAt(controller.currentIndex);
                }),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget bottomNav() {
    return Observer(builder: (_) {
      final controller = Provider.of<BaseController>(context);
      return CircleBottomNavigation(
          barBackgroundColor: Colors.black.withOpacity(0.0),
          circleColor: Colors.blue[900],
          inactiveIconColor: Colors.white,
          circleOutline: 0,
          activeIconColor: Colors.white,
          circleSize: 50,
          textColor: Colors.white,
          initialSelection: controller.currentIndex,
          onTabChangedListener: (value) {
            controller.updateCurrentIndex(value);
            controller.getNomePage(value);
          },
          tabs: [
            TabData(icon: LineAwesomeIcons.user, title: 'Dados'),
            TabData(icon: Icons.person_outline, title: 'Cliente'),
            TabData(icon: LineAwesomeIcons.pencil, title: 'Projeto'),
            TabData(icon: LineAwesomeIcons.edit, title: 'Layout'),
            TabData(icon: LineAwesomeIcons.file_pdf_o, title: 'PDF'),
          ]);
    });
  }

  Widget floation() {
    final controller = Provider.of<BaseController>(context);
    final projetoController = Provider.of<ProjetoController>(context);
    final clientesController = Provider.of<ClientesController>(context);
    final userController = Provider.of<UserController>(context);
    return Observer(builder: (_) {
      return (controller.currentIndex == 2)
          ? Container(
              child: FloatingActionButton(
                  backgroundColor: Colors.blue[900],
                  child: Icon(
                    LineAwesomeIcons.plus,
                  ),
                  mini: true,
                  onPressed: () {
                    showAlertDialog1(context, projetoController);
                  }),
            )
          : FabCircularMenu(
              fabOpenColor: Colors.blue[900],
              fabCloseColor: Colors.blue[900],
              fabColor: Colors.blue[900],
              fabSize: 41,
              ringColor: Colors.blue[900].withAlpha(50),
              ringDiameter: 200.0,
              fabOpenIcon: Icon(
                Icons.menu,
                color: Colors.white,
              ),
              fabCloseIcon: Icon(Icons.close, color: Colors.white),
              children: <Widget>[
                  IconButton(
                      icon: Icon(LineAwesomeIcons.home, color: Colors.white),
                      onPressed: () {
                        print('Home');
                      }),
                  IconButton(
                      icon: Icon(LineAwesomeIcons.save, color: Colors.white),
                      onPressed: () async {
                        await clientesController.setClientes(
                            clientesController.userId,
                            clientesController.nome,
                            clientesController.email,
                            clientesController.telefone,
                            clientesController.endereco,
                            clientesController.numero);
                        print('Salvar');
                      })
                ]);
    });
  }

  showAlertDialog1(BuildContext context, controller) {
    controller.categoriaController.text = '';
    controller.itemController.text = '';
    controller.valorController.text = '';
    controller.tempoController.text = '';
    controller.tempo = '';
    controller.medida = '';
    controller.medidaController.text = '';
    controller.quantidadeController.text = '';
    controller.quantidade = 0.0;
    controller.valorTotal = 0.0;
    controller.categoria = '';
    controller.descricao = '';
    controller.valor = 0.0;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AddItem();
      },
    );
  }
}
