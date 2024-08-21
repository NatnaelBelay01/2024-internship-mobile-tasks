import 'package:ecommerce/features/product/domain/entities/product_ent.dart';
import 'package:ecommerce/features/product/domain/use_cases/getallproduct.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:ecommerce/features/product/domain/use_cases/getproduct.dart';
import '../../helpers/test_helper.mocks.dart';
import 'package:dartz/dartz.dart';


void main(){

	late GetAllProduct getallProduct;
	late MockProductRepositories mockrepo;


	setUp((){
		mockrepo = MockProductRepositories();
		getallProduct = GetAllProduct(productrepo: mockrepo);
	});	


  Product product1 = const Product(
      id: '1',
      name: 'shoe',
      description: 'a shoe',
      price: 342,
      imageurl: 'img/b.jpg');

  Product product2 = const Product(
      id: '1',
      name: 'shoe',
      description: 'a shoe',
      price: 342,
      imageurl: 'img/b.jpg');
	List<Product> checkValue = [product1, product2];

	test('Should use the repo to get product', () async {
	  when(mockrepo.getallProuduct()).thenAnswer((_) async => Right(checkValue));
		final result = await getallProduct();
		expect(result, Right(checkValue));
	});

}
