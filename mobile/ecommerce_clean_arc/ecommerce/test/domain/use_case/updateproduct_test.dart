import 'package:ecommerce/features/product/domain/entities/product_ent.dart';
import 'package:ecommerce/features/product/domain/use_cases/updateproduct.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../helpers/test_helper.mocks.dart';
import 'package:dartz/dartz.dart';

void main(){
	late MockProductRepositories mockrepo;
	late UpdateProduct updateprod;

	setUp((){
		mockrepo = MockProductRepositories();
		updateprod = UpdateProduct(productRepo: mockrepo);
	});

	Product product = const Product(id:'1', name:'shoe', description: 'a shoe', imageurl: 'img/b.jpg', price: 97);

	test('a test for the update repo', () async {

		when(mockrepo.updateProduct(product)).thenAnswer((_) async => Right(product));

		final result = await updateprod(product);

		expect(result, Right(product));

	});
}
