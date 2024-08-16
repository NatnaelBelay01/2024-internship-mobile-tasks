import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/exception.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/features/product/data/repositories/productrepositoriesimp.dart';
import 'package:ecommerce/features/product/data/models/product_model.dart';
import 'package:ecommerce/features/product/domain/entities/product_ent.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../helpers/repo_mocks/local/test_helper.mocks.dart';
import '../../helpers/repo_mocks/remote/test_helper.mocks.dart';
import '../../helpers/repo_mocks/network/test_helper.mocks.dart';
import 'package:mockito/mockito.dart';

void main() {
  late ProductRepositoryImp productrepoimp;
  late MockProductRemoteDataSource mockremote;
  late MockProductLocalDataSource mocklocal;
  late MockNetworkInfo mocknetwork;
  late Product product;
  late ProductModel productmodel;

  setUp(() {
    mockremote = MockProductRemoteDataSource();
    mocklocal = MockProductLocalDataSource();
    mocknetwork = MockNetworkInfo();
    product = const Product(
      id: '1',
      name: 'shoe',
      description: 'a shoe',
      price: 88,
      imageurl: 'img/b.jpg',
    );
    productrepoimp = ProductRepositoryImp(
      localdatasource: mocklocal,
      remotedatasource: mockremote,
      networkinfo: mocknetwork,
    );
    productmodel = const ProductModel(
      id: '1',
      name: 'shoe',
      description: 'a shoe',
      price: 88,
      imageurl: 'img/b.jpg',
    );
  });

  group(' for create Product device is online', () {
    setUp(() {
      when(mocknetwork.isConnected).thenAnswer((_) async => true);
    });

    test(
        'should return remote data when the call to the remote data source is successfull',
        () async {
      when(mockremote.createProduct(any)).thenAnswer((_) async => productmodel);
      when(mocklocal.cacheProduct(any)).thenAnswer((_) async => productmodel);
      final result = await productrepoimp.createProduct(product);
      expect(result, equals(Right(product)));
    });

    test(
        'should cache the data when the call to the remote data source is successfull',
        () async {
      when(mockremote.createProduct(any)).thenAnswer((_) async => productmodel);
      when(mocklocal.cacheProduct(any)).thenAnswer((_) async => productmodel);
      await productrepoimp.createProduct(product);
      verify(mocklocal.cacheProduct(productmodel));
    });

    test(
        'should rerturn server failure when the call to server is unsuccessfull',
        () async {
      when(mockremote.createProduct(any)).thenThrow(ServerException());
      when(mocklocal.cacheProduct(any)).thenAnswer((_) async => productmodel);
      final result = await productrepoimp.createProduct(product);
      verifyZeroInteractions(mocklocal);
      expect(result, equals(const Left(ServerFailure())));
    });
  });

  group('for create product The device is offline', () {
    setUp(() {
      when(mocknetwork.isConnected).thenAnswer((_) async => false);
    });

    test('should return Failure', () async {
      when(mockremote.createProduct(any)).thenThrow(ServerException());
      when(mocklocal.cacheProduct(any)).thenAnswer((_) async => productmodel);
      final result = await productrepoimp.createProduct(product);
      verifyZeroInteractions(mockremote);
      expect(result, equals(const Left(ServerFailure())));
    });
  });

  group(' for update Product device is online', () {
    setUp(() {
      when(mocknetwork.isConnected).thenAnswer((_) async => true);
    });

    test(
        'should return remote data when the call to the remote data source is successfull',
        () async {
      when(mockremote.updateProduct(any)).thenAnswer((_) async => productmodel);
      when(mocklocal.cacheProduct(any)).thenAnswer((_) async => productmodel);
      final result = await productrepoimp.updateProduct(product);
      expect(result, equals(Right(product)));
    });

    test(
        'should cache the data when the call to the remote data source is successfull',
        () async {
      when(mockremote.updateProduct(any)).thenAnswer((_) async => productmodel);
      when(mocklocal.cacheProduct(any)).thenAnswer((_) async => productmodel);
      await productrepoimp.updateProduct(product);
      verify(mocklocal.cacheProduct(productmodel));
    });

    test(
        'should rerturn server failure when the call to server is unsuccessfull',
        () async {
      when(mockremote.updateProduct(any)).thenThrow(ServerException());
      when(mocklocal.cacheProduct(any)).thenAnswer((_) async => productmodel);
      final result = await productrepoimp.updateProduct(product);
      verifyZeroInteractions(mocklocal);
      expect(result, equals(const Left(ServerFailure())));
    });
  });

  group('for update product The device is offline', () {
    setUp(() {
      when(mocknetwork.isConnected).thenAnswer((_) async => false);
    });

    test('should return Failure', () async {
      when(mockremote.updateProduct(any)).thenThrow(ServerException());
      when(mocklocal.cacheProduct(any)).thenAnswer((_) async => productmodel);
      final result = await productrepoimp.updateProduct(product);
      verifyZeroInteractions(mockremote);
      expect(result, equals(const Left(ServerFailure())));
    });
  });

  group(' for getproduct Product device is online', () {
    setUp(() {
      when(mocknetwork.isConnected).thenAnswer((_) async => true);
    });

    test(
        'should return remote data when the call to the remote data source is successfull',
        () async {
      when(mockremote.getProuduct(any)).thenAnswer((_) async => productmodel);
      when(mocklocal.cacheProduct(any)).thenAnswer((_) async => productmodel);
      final result = await productrepoimp.getProuduct(product.id);
      expect(result, equals(Right(product)));
    });

    test(
        'should cache the data when the call to the remote data source is successfull',
        () async {
      when(mockremote.getProuduct(any)).thenAnswer((_) async => productmodel);
      when(mocklocal.cacheProduct(any)).thenAnswer((_) async => productmodel);
      await productrepoimp.getProuduct(product.id);
      verify(mocklocal.cacheProduct(productmodel));
    });

    test(
        'should rerturn server failure when the call to server is unsuccessfull',
        () async {
      when(mockremote.getProuduct(any)).thenThrow(ServerException());
      when(mocklocal.cacheProduct(any)).thenAnswer((_) async => productmodel);
      final result = await productrepoimp.getProuduct(product.id);
      verifyZeroInteractions(mocklocal);
      expect(result, equals(const Left(ServerFailure())));
    });
  });

  group('for get product The device is offline', () {
    setUp(() {
      when(mocknetwork.isConnected).thenAnswer((_) async => false);
    });

    test('should return a product', () async {
      when(mocklocal.getLastProductModel())
          .thenAnswer((_) async => productmodel);
      final result = await productrepoimp.getProuduct(product.id);
      verifyZeroInteractions(mockremote);
      expect(result, equals(Right(product)));
    });

    test('should return Failure', () async {
      when(mocklocal.getLastProductModel()).thenThrow(CacheException());
      final result = await productrepoimp.getProuduct(product.id);
      verifyZeroInteractions(mockremote);
      expect(result, equals(const Left(CacheFailure())));
    });
  });
	group('delete product', () {
    setUp(() {
      when(mocknetwork.isConnected).thenAnswer((_) async => true);
    });
	  test('should call the delete product method on the remote data source', () async {
	    when(mockremote.deleteProduct(any)).thenAnswer((_) async => {});
			await productrepoimp.deleteProduct(productmodel.id);
			verify(mockremote.deleteProduct(any));
	  });
	});
	group('delete product when the device is offline', () {
	  setUp((){
			when(mocknetwork.isConnected).thenAnswer((_) async => false);
		});

    test('should return Failure', () async {
      when(mockremote.updateProduct(any)).thenThrow(ServerException());
      final result = await productrepoimp.updateProduct(product);
      verifyZeroInteractions(mockremote);
      expect(result, equals(const Left(ServerFailure())));
    });
	});
}
