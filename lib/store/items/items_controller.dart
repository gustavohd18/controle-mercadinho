import 'package:controle_do_mercadinho/model/item.dart';
import 'package:controle_do_mercadinho/service/database.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part 'items_controller.g.dart';

class ItemsController = _ItemsControllerBase with _$ItemsController;

abstract class _ItemsControllerBase with Store {
  final ItemDatabase dbHelper = Modular.get();

  _ItemsControllerBase() {
    _loadContent();
  }

  @observable
  Future<List<Item>> items;

  @observable
  double total = 0.0;

  void _loadContent() {
    items = dbHelper.getItems();
  }

  void reload() async {
    _loadContent();
    total = await dbHelper.getValue();
  }

  Future<List<Item>> loadingContent() {
    return dbHelper.getItems();
  }

  Future<double> loadingValues() {
    return dbHelper.getValue();
  }

  void delete(int id) {
    dbHelper.delete(id.toString());
  }

  void insert(Item item) {
    dbHelper.insertItem(item);
  }
}
