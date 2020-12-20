
import 'package:controle_do_mercadinho/model/item.dart';

abstract class IDatabase {
  Future<void> insertItem(Item item);
  Future<List<Item>> getItems();
  Future<void> delete(String id);
}
