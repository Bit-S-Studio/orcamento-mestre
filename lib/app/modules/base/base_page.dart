import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:orcamento_mestre/app/modules/dadosProjeto/dadosProjeto_module.dart';
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

class _BasePageState extends State<BasePage> {
  MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    keywords: <String>['cursos', 'beautiful apps'],
    contentUrl: 'https://flutter.io',
    childDirected: false,
    //testDevices: <String>[],
  );

  BannerAd myBanner;

  void startBanner() {
    myBanner = BannerAd(
      adUnitId: BannerAd.testAdUnitId,
      size: AdSize.smartBanner,
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        if (event == MobileAdEvent.opened) {
          // MobileAdEvent.opened
          // MobileAdEvent.clicked
          // MobileAdEvent.closed
          // MobileAdEvent.failedToLoad
          // MobileAdEvent.impression
          // MobileAdEvent.leftApplication
        }
        print("BannerAd event is $event");
      },
    );
  }

  void displayBanner() {
    myBanner
      ..load()
      ..show(
        anchorOffset: 95.0,
        anchorType: AnchorType.top,
      );
  }

  @override
  void dispose() {
    myBanner?.dispose();
    myBanner?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    FirebaseAdMob.instance
        .initialize(appId: "ca-app-pub-3740593238666941~2885272429");

    startBanner();
    displayBanner();
  }

  List widgetOptions = [
    TipoModule(),
    DadosProjetoModule(),
    DadosProjetoModule(),
    LayoutModule(),
    OrcamentoModule(),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        background(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Observer(builder: (_) {
            return page();
          }),
          bottomNavigationBar: bottomNav(),
        ),
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
    return Column(
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
            margin: EdgeInsets.only(left: 24, right: 24),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40), color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Observer(builder: (_) {
                return widgetOptions.elementAt(controller.currentIndex);
              }),
            ),
          ),
        )
      ],
    );
  }

  Widget bottomNav() {
    return Observer(builder: (_) {
      final controller = Provider.of<BaseController>(context);
      return Theme(
          data: Theme.of(context).copyWith(
              canvasColor: Colors.transparent,
              textTheme: Theme.of(context)
                  .textTheme
                  .copyWith(caption: new TextStyle(color: Colors.yellow))),
          child: BottomNavigationBar(
              elevation: 0.0,
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.black.withOpacity(0.0),
              selectedItemColor: Colors.blue[900],
              unselectedItemColor: Colors.blue[900],
              currentIndex: controller.currentIndex,
              onTap: (value) {
                controller.updateCurrentIndex(value);
                controller.getNomePage(value);
              },
              items: [
                BottomNavigationBarItem(
                    icon: Icon(
                      LineAwesomeIcons.flag,
                      color: Colors.white,
                    ),
                    title: Text(
                      'Start',
                      style: TextStyle(color: Colors.white),
                    )),
                BottomNavigationBarItem(
                    icon: Icon(
                      LineAwesomeIcons.paste,
                      color: Colors.white,
                    ),
                    title: Text(
                      'Dados',
                      style: TextStyle(color: Colors.white),
                    )),
                BottomNavigationBarItem(
                    icon: Icon(
                      LineAwesomeIcons.paper_plane,
                      color: Colors.white,
                    ),
                    title: Text(
                      'Projeto',
                      style: TextStyle(color: Colors.white),
                    )),
                BottomNavigationBarItem(
                    icon: Icon(
                      LineAwesomeIcons.connectdevelop,
                      color: Colors.white,
                    ),
                    title: Text(
                      'Layout',
                      style: TextStyle(color: Colors.white),
                    )),
                BottomNavigationBarItem(
                    icon: Icon(
                      LineAwesomeIcons.calculator,
                      color: Colors.white,
                    ),
                    title: Text(
                      'Orçamento',
                      style: TextStyle(color: Colors.white),
                    ))
              ]));
    });
  }
}
