class CartItem {
  String id;
  String title;
  int quantity;
  double price;
  String image;

  CartItem({this.id, this.title, this.quantity, this.price, this.image});

  CartItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    quantity = json['quantity'];
    price = json['price'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    data['image'] = this.image;
    return data;
  }
}
