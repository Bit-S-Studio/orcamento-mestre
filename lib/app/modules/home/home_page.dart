import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = ""}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Container(
                    color: Colors.blue[900],
                    height: MediaQuery.of(context).size.height *.08,
                    width: MediaQuery.of(context).size.width *.8,
                    margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height *.18,
                    ),
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.height *.02,
                      top: MediaQuery.of(context).size.height *.026,
                    ),
                    child: Text(
                        'Escolha um padrão para seu orçamento',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.blue[900],
                    height: MediaQuery.of(context).size.height *.4,
                    width: MediaQuery.of(context).size.width *.8,
                    margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height *.005,
                    ),
                    child: Center(child: MyDropDownWidget()),
                  ),
                  Container(
                    color: Colors.grey[600],
                    height: MediaQuery.of(context).size.height *.08,
                    width: MediaQuery.of(context).size.width *.8,
                    child: RaisedButton(
                      child: Text('Continuar',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22
                      ),
                      ),
                        onPressed: (null)),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyDropDownWidget extends StatefulWidget {
  MyDropDownWidget({Key key}) : super(key: key);

  @override
  _MyDropDownWidgetState createState() => _MyDropDownWidgetState();
}

class _MyDropDownWidgetState extends State<MyDropDownWidget> {
  String dropdownValue = 'Desenvolvedor Mobile';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: Icon(Icons.arrow_downward,
        color: Colors.white,
      ),
      dropdownColor: Colors.grey,
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Colors.deepPurple),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: <String>[
        'Desenvolvedor Mobile',
        'Web Designer',
        'Interior Designer',
        'Digital Illustrator']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              fontWeight: FontWeight.bold
            ),
          ),
        );
      }).toList(),
    );
  }
}

