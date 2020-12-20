import 'package:controle_do_mercadinho/components/itemTiles.dart';
import 'package:controle_do_mercadinho/model/item.dart';
import 'package:flutter/material.dart';

class ItemList extends StatelessWidget {
  final Future<List<Item>> _future;
  final String text;
  final Function() f;
  ItemList(this._future, this.text, this.f);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Item>>(
      future: _future,
      builder: (context, snapshot) {
        return snapshot.hasData && snapshot.data.length > 0
            ? ListView.builder(
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.all(6.0),
                itemCount: snapshot.data.length,
                itemBuilder: (_, int position) {
                  final item = snapshot.data[position];
                  return ItemTiles(
                      item.id.toString(),
                      item.name,
                      item.price.toString(),
                      item.amount.toString(),
                      f
                      );
                })
            : Center(
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              );
      },
    );
  }
}
