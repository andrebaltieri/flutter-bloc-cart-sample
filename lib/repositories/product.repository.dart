import 'package:cart/models/product.model.dart';
import 'package:dio/dio.dart';

class ProductRepository {
  Future<List<Product>> getAll() async {
    var url = "https://balta-eshop.azurewebsites.net/v1/products";
    Response response = await Dio().get(url);
    return (response.data as List).map((p) => Product.fromJson(p)).toList();
  }
}
