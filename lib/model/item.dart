class Item {
   int id;
   String name;
   double price;
   int amount;

  Item({this.id, this.name, this.price, this.amount});

    Item.origin(int id, String name, double price,
      int amount) {
    this.id = id;
    this.name = name;
    this.price = price;
    this.amount = amount;
  }


    Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'amount': amount 
    };
  }
}
