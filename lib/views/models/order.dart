import 'package:delivery_system/views/models/menu.dart';

enum Status {
  unchecked,
  cooking,
  comleted,
  canceled,
}

class Order {
  Order(
    this.number,
    this.name,
    this.compName,
    this.menus,
    this.status,
    this.subtotal,
    this.tax,
  );
  int number;
  String name;
  String compName;
  List<Menu> menus;
  Status status;
  int subtotal;
  int tax;
}
