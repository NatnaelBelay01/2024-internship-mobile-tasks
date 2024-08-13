import 'package:ecommerce/features/product/domain/use_cases/deleteproduct.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../helpers/test_helper.mocks.dart';
import 'package:dartz/dartz.dart';


void main(){
	late MockProductRepositories mockrepo;
	late DeleteProduct deleteprod;

	setUp((){
		mockrepo = MockProductRepositories();
		deleteprod = DeleteProduct(productrepo: mockrepo);
	});

	const id = '1';


	test('this tests the delete', () async {

		when(mockrepo.deleteProduct(id)).thenAnswer((_) async => Right(deleteprod));

		await deleteprod(id);

		verify(mockrepo.deleteProduct(id)).called(1);
		verifyNoMoreInteractions(mockrepo);
	});
	
}
