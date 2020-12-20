// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'items_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ItemsController on _ItemsControllerBase, Store {
  final _$itemsAtom = Atom(name: '_ItemsControllerBase.items');

  @override
  Future<List<Item>> get items {
    _$itemsAtom.reportRead();
    return super.items;
  }

  @override
  set items(Future<List<Item>> value) {
    _$itemsAtom.reportWrite(value, super.items, () {
      super.items = value;
    });
  }

  final _$totalAtom = Atom(name: '_ItemsControllerBase.total');

  @override
  double get total {
    _$totalAtom.reportRead();
    return super.total;
  }

  @override
  set total(double value) {
    _$totalAtom.reportWrite(value, super.total, () {
      super.total = value;
    });
  }

  @override
  String toString() {
    return '''
items: ${items},
total: ${total}
    ''';
  }
}
