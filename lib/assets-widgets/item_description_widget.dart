import 'package:flutter/material.dart';

class ItemDescritionWidget extends StatefulWidget {
  @override
  _ItemDescritionWidgetState createState() => _ItemDescritionWidgetState();
}

class _ItemDescritionWidgetState extends State<ItemDescritionWidget> {

  final _itemController = TextEditingController();
  final _valorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.height;
    return Container(
      color: Colors.blue[900],
      child: Container(
        height: height *.16,
        width: width,
        margin: EdgeInsets.only(
            top: height * .015,
            bottom: height * .015,
            left: width * .015,
            right: width * .015),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(12)),
            boxShadow: [
              new BoxShadow(
                  color: Colors.black.withAlpha(70),
                  offset: const Offset(3.0, 10.0),
                  blurRadius: 15.0)
            ]),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      height: height * .06,
                      width: width * .32,
                      margin: EdgeInsets.only(left: width * .02),
                      child: Center(
                        child: TextFormField(
                          controller: _itemController,
                          decoration: InputDecoration(
                            contentPadding:
                            new EdgeInsets.symmetric(
                                vertical: 10.0,
                                horizontal: 10.0),
                            labelText: "Descrição do Ítem",
                            labelStyle: TextStyle(fontSize: 12),
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
                              return "O campo Descrição do ítem está vazio!";
                          },
                        ),
                      ),
                    ),
                    Container(
                      height: height * .06,
                      width: width * .13,
                      margin: EdgeInsets.only(left: width * .005),
                      child: Center(
                        child: TextFormField(
                          controller: _valorController,
                          decoration: InputDecoration(
                            contentPadding:
                            new EdgeInsets.symmetric(
                                vertical: 10.0,
                                horizontal: 10.0),
                            labelText: "R\$ 0.000,00",
                            labelStyle: TextStyle(fontSize: 12),
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
                  ],
                ),
                Row(
                  children: [
                    Container(
                      height: height * .06,
                      width: width * .32,
                      margin: EdgeInsets.only(
                          top: height * .01, left: width * .02),
                      decoration: BoxDecoration(
                          color: Colors.blue[900],
                          borderRadius: BorderRadius.all(
                              Radius.circular(12))),
                      child: Center(
                          child: Text(
                            'Estimativa de tempo de execução',
                            style: TextStyle(
                                color: Colors.white, fontSize: 12),
                          )),
                    ),
                    Container(
                      height: height * .06,
                      width: width * .13,
                      margin: EdgeInsets.only(
                          top: height * .01, left: width * .005),
                      child: Center(
                        child: TextFormField(
                          controller: _valorController,
                          decoration: InputDecoration(
                            contentPadding:
                            new EdgeInsets.symmetric(
                                vertical: 10.0,
                                horizontal: 10.0),
                            labelText: "12:30h",
                            labelStyle: TextStyle(fontSize: 12),
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
                  ],
                ),
              ],
            ),
            Container(
              height: height * .12,
              width: width * .06,
              margin: EdgeInsets.only(left: width * .02),
              decoration: BoxDecoration(
                  color: Colors.blue[900],
                  borderRadius:
                  BorderRadius.all(Radius.circular(12))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: height * .06,
                    width: width * .1,
                    child: IconButton(
                        icon: Icon(
                          Icons.add_circle,
                          color: Colors.white,
                        ),
                        onPressed: null),
                  ),
                  Container(
                    height: height * .06,
                    width: width * .1,
                    child: IconButton(
                        icon: Icon(
                          Icons.delete_forever,
                          color: Colors.white,
                        ),
                        onPressed: null),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
