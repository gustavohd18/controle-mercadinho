import 'package:controle_do_mercadinho/service/database.dart';
import 'package:flutter/material.dart';

class ItemTiles extends StatelessWidget {
  final String id, title, price, qtd;

  final Function() f;

  ItemTiles(this.id, this.title, this.price, this.qtd, this.f);

  final dbHelper = ItemDatabase.instance;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
            child: ListTile(
      title: Text(title),
      subtitle: Text("Preço: " + price),
      trailing: Icon(Icons.food_bank_outlined, color: Colors.black),
      onTap: () {
        dbHelper.delete(id.toString());
        f();
      },
    )));
  }
}
