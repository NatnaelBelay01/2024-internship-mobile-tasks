import 'package:ecommerce/features/product/presentation/bloc/product_bloc.dart';
import 'package:ecommerce/features/product/presentation/bloc/product_states.dart';
import '../../helpers/use_case_mocks/delete/test_helper.mocks.dart';
import '../../helpers/use_case_mocks/getall/test_helper.mocks.dart';
import '../../helpers/use_case_mocks/insert/test_helper.mocks.dart';
import '../../helpers/use_case_mocks/test_helper.mocks.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/use_case_mocks/update/test_helper.mocks.dart';



void main(){
	late MockGetProduct mockGetProduct;
	late ProductBloc productBloc;
	late MockUpdateProduct updateProduct;
	late MockInsertproduct createProduct;
	late MockDeleteProduct deleteProduct;
	late MockGetAllProduct getallProduct;


	setUp(() {
		mockGetProduct = MockGetProduct();
		updateProduct = MockUpdateProduct();
		createProduct = MockInsertproduct();
		deleteProduct = MockDeleteProduct();
		getallProduct = MockGetAllProduct();
		productBloc = ProductBloc(getProduct: mockGetProduct, updateProduct: updateProduct, deleteProduct: deleteProduct, createProduct: createProduct, getallProduct: getallProduct);
	});


	test('Initial state should be InitialState', () {

		expect(productBloc.state, InitialState());
	  
	});
}
