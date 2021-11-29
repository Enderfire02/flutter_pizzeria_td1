import 'package:flutter_pizzeria_td1/Models/pizza.dart';


class CartItem {
  final Pizza pizza;
  int quantity;

  CartItem(this.pizza, [this.quantity = 1]);
}

class Cart {
  List<CartItem> _items = [];

  int totalItems() {
    return _items.length;
  }

  CartItem getCartItem(int index) {
    return _items[index];
  }

  void addProduct(Pizza pizza) {
    // Recherche du produit
    int index = findCartItemIndex(pizza.id);
    if (index == -1) {
      _items.add(CartItem(pizza));
    } else {
      CartItem item = _items[index];
      item.quantity++;
    }
  }

  void removeProduct(Pizza pizza) {
    int index = findCartItemIndex(pizza.id);
    if (index != -1) {
      _items.removeAt(index);
    }
  }

  int findCartItemIndex(int id) {
    return _items.indexWhere((element) => element.pizza.id == id);
  }

  double tva()
  {
   double priceHT = ht() * 0.2;
    return priceHT;
  }

  double ht() {
    double sum = 0;
    for (var i = 0; i < _items.length; i++) {
      sum += (_items[i].pizza.total * _items[i].quantity);
    }
    return sum;
  }

  double getTotal() {
    double prixFinal = ht() + tva();
    return prixFinal;
  }
}
