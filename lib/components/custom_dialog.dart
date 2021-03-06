import 'dart:math';
import 'dart:ui';
import 'package:controle_do_mercadinho/model/item.dart';
import 'package:controle_do_mercadinho/service/database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

import 'constants.dart';

class CustomDialogBox extends StatefulWidget {
  final String title, descriptions, text;
  final Image img;

  CustomDialogBox(
      {Key key, this.title, this.descriptions, this.text, this.img, this.f})
      : super(key: key);

  final priceController = TextEditingController();

  final titleController = TextEditingController();

  final dbHelper = ItemDatabase.instance;

  final Function() f;

  @override
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  int _currentValue = 1;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Constants.padding),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
              left: Constants.padding,
              top: Constants.avatarRadius + Constants.padding,
              right: Constants.padding,
              bottom: Constants.padding),
          margin: EdgeInsets.only(top: Constants.avatarRadius),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(Constants.padding),
              boxShadow: [
                BoxShadow(
                    color: Colors.black, offset: Offset(0, 10), blurRadius: 10),
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                widget.title,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Nome',
                  icon: Icon(Icons.title_outlined),
                ),
                controller: widget.titleController,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Preço",
                  icon: Icon(Icons.money),
                ),
                controller: widget.priceController,
              ),
              SizedBox(
                height: 22,
              ),
              Text("Quantidade: $_currentValue"),
              NumberPicker.integer(
                  initialValue: _currentValue,
                  minValue: 1,
                  maxValue: 100,
                  onChanged: (newValue) =>
                      setState(() => _currentValue = newValue)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: FlatButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          "Cancelar",
                          style: TextStyle(fontSize: 16),
                        )),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: FlatButton(
                        onPressed: () {
                          var id = new Random().nextInt(100);
                          var name = widget.titleController.text;
                          var price = _currentValue *
                              double.parse(widget.priceController.text);
                          var amount = _currentValue;
                          final _item = Item.origin(id, name, price, amount);
                          widget.dbHelper.insertItem(_item);
                          widget.f();
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          "Adicionar",
                          style: TextStyle(fontSize: 16),
                        )),
                  ),
                ],
              )
            ],
          ),
        ),
        Positioned(
          left: Constants.padding,
          right: Constants.padding,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: Constants.avatarRadius,
            child: ClipRRect(
                borderRadius:
                    BorderRadius.all(Radius.circular(Constants.avatarRadius)),
                child: Image.asset("assets/item.jpg")),
          ),
        ),
      ],
    );
  }
}
