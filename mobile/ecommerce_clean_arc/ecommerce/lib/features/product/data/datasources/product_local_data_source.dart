import 'dart:convert';

import 'package:ecommerce/core/error/exception.dart';
import 'package:ecommerce/features/product/data/models/product_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ProductLocalDataSource {
  Future<ProductModel> getLastProductModel();

  Future<ProductModel> cacheProduct(ProductModel productmodel);
}

const CACHE = 'CACHED_PRODUCT';

class ProductLocalDataSourceImpl implements ProductLocalDataSource {
  final SharedPreferences sharedPreferences;
  ProductModel proud = const ProductModel(
      id: 'b', name: 'b', description: 'c', price: 34, imageurl: 'c');

  ProductLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<ProductModel> getLastProductModel() {
    final jsonString = sharedPreferences.getString(CACHE);
		if (jsonString != null){
    	return Future.value(ProductModel.fromJson(json.decode(jsonString)));
		} else{
			throw CacheException();
		}
  }

  @override
  Future<ProductModel> cacheProduct(ProductModel productmodel) {
		sharedPreferences.setString(CACHE, json.encode(productmodel.toJson()));
    return Future.value(productmodel);
  }
}
