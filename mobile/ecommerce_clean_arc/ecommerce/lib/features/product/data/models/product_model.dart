
import 'package:ecommerce/features/product/domain/entities/product_ent.dart';

class ProductModel extends Product {
  const ProductModel(
      {required super.id,
      required super.name,
      required super.description,
      required super.price,
      required super.imageurl});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      imageurl: json['imageurl'],
      price: (json['price'] as num).toDouble(),
    );
  }

	Map<String, dynamic> toJson(){

		Map<String, dynamic> result =  {
			"id" : id,
			"name" : name,
			"description" : description,
			"imageurl" : imageurl,
			"price" : price
		};
		return result;
	}
}
