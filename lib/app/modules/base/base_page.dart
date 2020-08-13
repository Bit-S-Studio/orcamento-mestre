import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:orcamento_mestre/app/modules/dadosProjeto/dadosProjeto_module.dart';
import 'package:orcamento_mestre/app/modules/home/home_module.dart';
import 'package:orcamento_mestre/app/modules/layout/layout_module.dart';
import 'package:orcamento_mestre/app/modules/orcamento/orcamento_module.dart';
import 'package:orcamento_mestre/app/modules/tipo/tipo_module.dart';
import 'package:provider/provider.dart';
import 'base_controller.dart';

class BasePage extends StatefulWidget {
  final String title;
  const BasePage({Key key, this.title = "Base"}) : super(key: key);

  @override
  _BasePageState createState() => _BasePageState();
}

class _BasePageState extends ModularState<BasePage, BaseController> {
  List widgetOptions = [
    TipoModule(),
    HomeModule(),
    DadosProjetoModule(),
    LayoutModule(),
    OrcamentoModule(),
  ];

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<BaseController>(context);
    return Scaffold(
      body: Observer(builder: (_) {
        return widgetOptions.elementAt(controller.currentIndex);
      }),
      bottomNavigationBar: bottomNav(),
    );
  }

  Widget bottomNav() {
    return Observer(builder: (_) {
      final controller = Provider.of<BaseController>(context);
      return Theme(
          data: Theme.of(context).copyWith(
              // sets the background color of the `BottomNavigationBar`
              canvasColor: Colors.transparent,
              // sets the active color of the `BottomNavigationBar` if `Brightness` is light
              primaryColor: Colors.red,
              textTheme: Theme.of(context)
                  .textTheme
                  .copyWith(caption: new TextStyle(color: Colors.yellow))),
          child: BottomNavigationBar(
              elevation: 0.0,
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.grey[900],
              selectedItemColor: Colors.blue[900],
              unselectedItemColor: Colors.blue[900],
              currentIndex: controller.currentIndex,
              onTap: (value) => controller.updateCurrentIndex(value),
              items: [
                BottomNavigationBarItem(
                    icon: Icon(LineAwesomeIcons.flag,
                      color: Colors.white,
                    ), title: Text('Start',
                  style: TextStyle(
                      color: Colors.white
                  ),
                )),
                BottomNavigationBarItem(
                    icon: Icon(LineAwesomeIcons.paste,
                      color: Colors.white,
                    ), title: Text('Dados',
                  style: TextStyle(
                      color: Colors.white
                  ),
                )),
                BottomNavigationBarItem(
                    icon: Icon(LineAwesomeIcons.paper_plane,
                      color: Colors.white,
                    ),
                    title: Text('Projeto',
                      style: TextStyle(
                          color: Colors.white
                      ),
                    )),
                BottomNavigationBarItem(
                    icon: Icon(LineAwesomeIcons.connectdevelop,
                      color: Colors.white,
                    ),
                    title: Text('Layout',
                      style: TextStyle(
                          color: Colors.white
                      ),
                    )),
                BottomNavigationBarItem(
                    icon: Icon(LineAwesomeIcons.calculator,
                      color: Colors.white,
                    ),
                    title: Text('Orçamento',
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ))
              ]));
    });
  }
}
