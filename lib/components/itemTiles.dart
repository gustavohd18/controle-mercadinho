import 'package:flutter/material.dart';

class ItemTiles extends StatelessWidget {
  final String id, title, price, qtd;

  ItemTiles(this.id, this.title, this.price, this.qtd);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
            child: ListTile(
      title: Text(title),
      subtitle: Text("Preço: " + price),
      trailing: Icon(Icons.food_bank_outlined, color: Colors.black),
      onTap: () {},
    )));
  }
}
