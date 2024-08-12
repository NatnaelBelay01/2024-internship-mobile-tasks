import 'package:ecommerce/features/product/domain/entities/product_ent.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:ecommerce/features/product/domain/use_cases/getproduct.dart';
import '../../helpers/test_helper.mocks.dart';

void main(){

	late GetProduct getproduct;
	late MockProductRepositories mockrepo;

	setUp((){
		mockrepo = MockProductRepositories();
		getproduct = GetProduct(productrepo: mockrepo);
	});
	
	Product product = Product(id:'1', name:'shoe', description: 'a shoe', price: 342, imageurl: 'img/b.jpg');
	const id = '1';
	test('should use the repo to get the product', () async {  
		
		when(mockrepo.getProuduct(id)).thenAnswer((_) async => product);

		final result = await getproduct(id);

		expect(result, product);
		
	});
}
