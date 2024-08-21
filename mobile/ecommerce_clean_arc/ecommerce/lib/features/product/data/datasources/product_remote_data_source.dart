import 'dart:convert';

import 'package:ecommerce/core/error/exception.dart';
import 'package:ecommerce/features/product/data/models/product_model.dart';
import 'package:http/http.dart' as http;

abstract class ProductRemoteDataSource {
  Future<ProductModel> createProduct(ProductModel product);
  Future<ProductModel> updateProduct(ProductModel product);
  Future<void> deleteProduct(String id);
  Future<ProductModel> getProuduct(String id);
  Future<List<ProductModel>> getallProuduct();
}

class ProductRemoteDataSourceImp implements ProductRemoteDataSource {
  ProductModel dummymodel = const ProductModel(
      id: 'a', name: 'b', description: 'c', imageurl: 'd', price: 4);

  final http.Client client;
  ProductRemoteDataSourceImp({required this.client});

  @override
  Future<ProductModel> createProduct(ProductModel product) async {
    final result = await client.post(
        Uri.parse(
            'https://g5-flutter-learning-path-be.onrender.com/api/v1/products/${product.id}'),
        body: json.encode(product.toJson()),
        headers: {'Content-Type': 'application/json'});
    if (result.statusCode == 201) {
      final Map<String, dynamic> productjson = json.decode(result.body);
      return Future.value(ProductModel.fromJson(productjson['data']));
    } else {
      throw (ServerException());
    }
  }

  @override
  Future<ProductModel> updateProduct(ProductModel product) async {
    final Map<String, dynamic> productData = {
      "name": product.name,
      "description": product.description,
      "price": product.price,
    };
    final result = await client.put(
        Uri.parse(
            'https://g5-flutter-learning-path-be.onrender.com/api/v1/products/${product.id}'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(productData));
    if (result.statusCode == 204) {
      return Future.value(product);
    } else {
      throw (ServerException());
    }
  }

  @override
  Future<void> deleteProduct(String id) async {
    final result = await client.delete(Uri.parse(
        'https://g5-flutter-learning-path-be.onrender.com/api/v1/products/$id'));
    if (result.statusCode == 204) {
      return Future.value(null);
    } else {
      throw (ServerException());
    }
  }

  @override
  Future<ProductModel> getProuduct(String id) async {
    final result = await client.get(
        Uri.parse(
            'https://g5-flutter-learning-path-be.onrender.com/api/v1/products/$id'),
        headers: {'Content-Type': 'application/json'});
    if (result.statusCode == 200) {
      final Map<String, dynamic> productjson = json.decode(result.body);
      final Map<String, dynamic> temp = productjson['data'];
      return Future.value(ProductModel.fromJson(temp));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<ProductModel>> getallProuduct() async {
    final result = await client.get(
        Uri.parse(
            'https://g5-flutter-learning-path-be.onrender.com/api/v1/products'),
        headers: {'Content-Type': 'application/json'});
    if (result.statusCode == 200) {
      final Map<String, dynamic> temp = json.decode(result.body);
      final List<dynamic> jsonproducts = temp['data'];
      final List<ProductModel> allproducts =
          jsonproducts.map((value) => ProductModel.fromJson(value)).toList();
      return Future.value(allproducts);
    } else {
      throw ServerException();
    }
  }
}
