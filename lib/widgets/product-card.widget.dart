import 'package:cart/blocs/cart.bloc.dart';
import 'package:cart/models/cart-item.model.dart';
import 'package:cart/models/product.model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatelessWidget {
  var product = new Product();

  ProductCard({
    @required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final price = new NumberFormat("#,##0.00", "pt_BR");
    final bloc = Provider.of<CartBloc>(context);

    var item = new CartItem(
      id: product.id,
      price: product.price,
      image: product.image,
      quantity: 1,
      title: product.title,
    );

    return Container(
      width: double.infinity,
      height: 150,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: <Widget>[
          Image.network(product.image),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Text(
                    product.title,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    "R\$ ${price.format(product.price)}",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  bloc.itemInCart(item)
                      ? FlatButton(
                          onPressed: () {
                            bloc.remove(item);
                          },
                          color: Colors.red,
                          child: Text("Remover"),
                        )
                      : FlatButton(
                          onPressed: () {
                            bloc.add(item);
                          },
                          color: Theme.of(context).primaryColor,
                          child: Text("Adicionar"),
                        ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
