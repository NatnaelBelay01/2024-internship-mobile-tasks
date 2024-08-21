import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/features/product/domain/entities/product_ent.dart';
import 'package:ecommerce/features/product/presentation/bloc/product_bloc.dart';
import 'package:ecommerce/features/product/presentation/bloc/product_event.dart';
import 'package:ecommerce/features/product/presentation/bloc/product_states.dart';
import 'package:mockito/mockito.dart';
import '../../helpers/use_case_mocks/delete/test_helper.mocks.dart';
import '../../helpers/use_case_mocks/getall/test_helper.mocks.dart';
import '../../helpers/use_case_mocks/insert/test_helper.mocks.dart';
import '../../helpers/use_case_mocks/test_helper.mocks.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/use_case_mocks/update/test_helper.mocks.dart';

void main() {
  late MockGetProduct mockGetProduct;
  late ProductBloc productBloc;
  late MockUpdateProduct updateProduct;
  late MockInsertproduct createProduct;
  late MockDeleteProduct deleteProduct;
  late MockGetAllProduct getallProduct;
  late Product product;

  setUp(() {
    mockGetProduct = MockGetProduct();
    updateProduct = MockUpdateProduct();
    createProduct = MockInsertproduct();
    deleteProduct = MockDeleteProduct();
    getallProduct = MockGetAllProduct();
    productBloc = ProductBloc(
        getProduct: mockGetProduct,
        updateProduct: updateProduct,
        deleteProduct: deleteProduct,
        createProduct: createProduct,
        getallProduct: getallProduct);
    product = const Product(
        id: '1', name: 'jfd', description: '23', price: 34, imageurl: 'gj');
  });

  test('Initial state should be InitialState', () {
    expect(productBloc.state, InitialState());
  });

  blocTest<ProductBloc, ProductStates>(
      'should emit loadingState and then LoadedSingleProduct',
      build: () {
        when(mockGetProduct.call(any)).thenAnswer((_) async => Right(product));
        return productBloc;
      },
      act: (bloc) => bloc.add(GetSingleProductEvent(productId: '1')),
      expect: () => [
            LoadingState(),
            LoadedSingleProduct(product: product),
          ]);

  blocTest<ProductBloc, ProductStates>('should emit Error state',
      build: () {
        when(mockGetProduct.call(any))
            .thenAnswer((_) async => const Left(ServerFailure()));
        return productBloc;
      },
      act: (bloc) => bloc.add(GetSingleProductEvent(productId: '1')),
      expect: () => [
            LoadingState(),
            ErrorState(),
          ]);
}
