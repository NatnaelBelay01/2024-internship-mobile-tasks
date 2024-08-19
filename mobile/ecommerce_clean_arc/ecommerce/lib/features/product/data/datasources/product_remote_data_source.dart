import 'dart:convert';

import 'package:ecommerce/core/error/exception.dart';
import 'package:ecommerce/features/product/data/models/product_model.dart';
import 'package:http/http.dart' as http;

abstract class ProductRemoteDataSource {
  Future<ProductModel> createProduct(ProductModel product);
  Future<ProductModel> updateProduct(ProductModel product);
  Future<void> deleteProduct(String id);
  Future<ProductModel> getProuduct(String id);
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
            'https://g5-flutter-learning-path-be.onrender.com/${product.id}'),
        body: json.encode(product.toJson()),
        headers: {'Content-Type': 'application/json'});
		if (result.statusCode == 201){
    	return Future.value(ProductModel.fromJson(json.decode(result.body)));
		} else{
			throw(ServerException());
		}
  }

  @override
  Future<ProductModel> updateProduct(ProductModel product) async {
		final result = await client.put(Uri.parse('https://g5-flutter-learning-path-be.onrender.com/${product.id}'), headers: {'Content-Type': 'application/json'}, body: json.encode(product.toJson()));
		if(result.statusCode == 204){
			return Future.value(product);
		} else{
			throw(ServerException());
		}
  }

  @override
  Future<void> deleteProduct(String id) async {
		final result = await client.delete(Uri.parse('https://g5-flutter-learning-path-be.onrender.com/$id'));
		if(result.statusCode == 204){
			return Future.value(null);
		} else{
			throw(ServerException());
		}
  }

  @override
  Future<ProductModel> getProuduct(String id) async {
    final result = await client.get(
        Uri.parse('https://g5-flutter-learning-path-be.onrender.com/$id'),
        headers: {'Content-Type': 'application/json'});
    if (result.statusCode == 200) {
      return Future.value(ProductModel.fromJson(json.decode(result.body)));
    } else {
      throw ServerException();
    }
  }
}
