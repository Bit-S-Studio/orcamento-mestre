import 'package:flutter/material.dart';
import 'package:orcamento_mestre/assets-widgets/item_description_widget.dart';

class CategoryItemWidget extends StatefulWidget {
  @override
  _CategoryItemWidgetState createState() => _CategoryItemWidgetState();
}

class _CategoryItemWidgetState extends State<CategoryItemWidget> {
  final _categoryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Stack(
          children: [
            Container(
              color: Colors.blue[900],
              height: height * .20,
              width: width,
            ),
            Container(
              margin: EdgeInsets.only(
                top: height * .01,
              ),
              child: Row(
                children: [
                  Container(
                    height: height * .03,
                    width: width * .40,
                    margin: EdgeInsets.only(
                        top: height * .01,
                        left: width * .015,
                        right: width * .015),
                    child: Text(
                      'Categoria',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    height: height * .06,
                    width: width * .08,
                    child: IconButton(
                        icon: Icon(
                          Icons.add_circle,
                          color: Colors.white,
                        ),
                        onPressed: null),
                  ),
                  Container(
                    height: height * .06,
                    width: width * .08,
                    child: IconButton(
                        icon: Icon(
                          Icons.delete_forever,
                          color: Colors.white,
                        ),
                        onPressed: null),
                  ),
                ],
              ),
            ),
            Container(
              height: height * .08,
              width: width,
              margin: EdgeInsets.only(
                  top: height * .075, left: width * .015, right: width * .015),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  boxShadow: [
                    new BoxShadow(
                        color: Colors.black.withAlpha(70),
                        offset: const Offset(3.0, 10.0),
                        blurRadius: 15.0)
                  ]),
              child: Container(
                height: height * .06,
                width: width * .32,
                margin: EdgeInsets.only(
                    top: height * .015,
                    bottom: height * .015,
                    left: width * .02,
                    right: width * .02),
                child: Center(
                  child: TextFormField(
                    controller: _categoryController,
                    decoration: InputDecoration(
                      contentPadding: new EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      labelText: "Front End",
                      labelStyle: TextStyle(fontSize: 12),
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
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ListView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: [
                ItemDescritionWidget(),
                ItemDescritionWidget(),
              ],
            ),
          ],
        )
      ],
    );
  }
}
