import 'package:ecommerce/features/product/data/models/product_model.dart';
import 'dart:convert';
import 'package:ecommerce/features/product/domain/entities/product_ent.dart';
import 'package:flutter_test/flutter_test.dart';

import '../fixtures/fixture.dart';

void main() {
  const productmodel = ProductModel(
    id: '01',
    name: 'shoe',
    description: 'a shoe',
    imageurl: 'img/b.jpg',
    price: 34,
  );

  test('This test should verify if productmodel is a sub class of product',
      () async {
    expect(productmodel, isA<Product>());
  });

  group('fromJSON', () {
    test('should return a valid product model', () async {
      final Map<String, dynamic> jsonmap = json.decode(fixture('product.json'));
      final result = ProductModel.fromJson(jsonmap);
      expect(result, productmodel);
    });
  });

	group('ToJson', (){
		test('this should return a json string form the object', () async {
			final Map<String, dynamic> jsonmap = json.decode(fixture('product.json'));
			final result = productmodel.toJson();
			expect(result, jsonmap);
		});
	});
}
