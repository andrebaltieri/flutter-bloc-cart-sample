import 'package:cart/models/product.model.dart';
import 'package:cart/repositories/product.repository.dart';
import 'package:cart/widgets/connection-manager.widget.dart';
import 'package:cart/widgets/product-card.widget.dart';
import 'package:flutter/material.dart';

class ProductsPage extends StatelessWidget {
  final repository = new ProductRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Produtos"),
      ),
      body: ConnectionManager(
        future: repository.getAll(),
        widget: (ctx, snpst) {
          List<Product> products = snpst.data;
          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (ctx, index) {
              return ProductCard(
                product: products[index],
              );
            },
          );
        },
      ),
    );
  }
}
