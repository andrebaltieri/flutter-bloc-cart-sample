import 'package:cart/models/cart-item.model.dart';
import 'package:flutter/widgets.dart';

class CartBloc extends ChangeNotifier {
  var cart = new List<CartItem>();
  double total = 0;

  get() {
    return cart;
  }

  add(CartItem item) {
    cart.add(item);
    calculateTotal();
  }

  remove(CartItem item) {
    cart.removeWhere((x) => x.id == item.id);
    calculateTotal();
  }

  itemInCart(CartItem item) {
    var result = false;
    cart.forEach((x) {
      if (item.id == x.id) result = true;
    });
    return result;
  }

  calculateTotal() {
    total = 0;
    cart.forEach((x) {
      total += (x.price * x.quantity);
    });
    notifyListeners();
  }
}
