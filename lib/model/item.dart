class Item {
  final int id;
  final String name;
  final double price;
  final int amount;

  Item({this.id, this.name, this.price, this.amount});

    Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'amount': amount 
    };
  }
}
