import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
part 'product.g.dart';

enum ProductField { id, name, price, count }

@HiveType(typeId: 0)
class Product extends HiveObject {
  Product({this.name = "", this.price = 0, this.count = 0});

  @HiveField(0)
  int id = UniqueKey().hashCode;

  @HiveField(1)
  String name;

  @HiveField(2)
  int price;

  @HiveField(3)
  int count;

  static int compareByField(Product a, Product b, ProductField sortFilter) {
    return switch (sortFilter) {
      ProductField.id => a.id.compareTo(b.id),
      ProductField.name => a.name.compareTo(b.name),
      ProductField.price => a.price.compareTo(b.price),
      ProductField.count => a.count.compareTo(b.count),
    };
  }
}
