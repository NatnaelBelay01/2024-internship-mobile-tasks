import 'dart:convert';

import 'package:ecommerce/core/error/exception.dart';
import 'package:ecommerce/features/product/data/models/product_model.dart';
import 'package:http/http.dart' as http;
import 'package:ecommerce/features/product/data/datasources/product_remote_data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../fixtures/fixture.dart';
import '../../helpers/repo_mocks/http/test_helper.mocks.dart';

void main() {
  late MockClient mockclient;
  late ProductRemoteDataSourceImp remotedataImp;
  late ProductModel productmodel;

  setUp(() {
    mockclient = MockClient();
    remotedataImp = ProductRemoteDataSourceImp(client: mockclient);
    productmodel = const ProductModel(
      id: "6672776eb905525c145fe0bb",
      name: "Anime website",
      description: "Explore anime characters.",
      price: 123,
      imageurl: "https://res.cloudinary.com/g5-mobile-track/image/upload/v1718777711/images/clmxnecvavxfvrz9by4w.jpg"
    );
  });

  group('test for getproduct', () {
    test('Should perform a GET request on the url', () async {
      when(mockclient.get(any, headers: anyNamed('headers')))
          .thenAnswer((_) async => http.Response(fixture('new.json'), 200));
      remotedataImp.getProuduct('01');
      verify(
        mockclient.get(
            Uri.parse('https://g5-flutter-learning-path-be.onrender.com/api/v1/products/01'),
            headers: {'Content-Type': 'application/json'}),
      );
    });

    test('Should return ProductModel when the repose is successfull', () async {
      when(mockclient.get(any, headers: anyNamed('headers')))
          .thenAnswer((_) async => http.Response(fixture('new.json'), 200));
      final result = await remotedataImp.getProuduct('01');
      expect(result, productmodel);
    });

    test('should throw a serverException', () async {
      when(mockclient.get(any, headers: anyNamed('headers')))
          .thenAnswer((_) async => http.Response('something went wrong', 404));
      final call = remotedataImp.getProuduct;
      expect(() => call('01'), throwsA(const TypeMatcher<ServerException>()));
    });
  });

  group('createProduct', () {
    test('Should perform a post request', () async {
      when(mockclient.post(any,
              body: anyNamed('body'), headers: anyNamed('headers')))
          .thenAnswer((_) async => http.Response(fixture('new.json'), 201));
      await remotedataImp.createProduct(productmodel);
      verify(mockclient.post(
          Uri.parse(
              'https://g5-flutter-learning-path-be.onrender.com/api/v1/products/${productmodel.id}'),
          body: json.encode(productmodel.toJson()),
          headers: {'Content-Type': 'application/json'}));
    });

    test('Should return a product model', () async {
      when(mockclient.post(any,
              body: anyNamed('body'), headers: anyNamed('headers')))
          .thenAnswer((_) async => http.Response(fixture('new.json'), 201));
      final result = await remotedataImp.createProduct(productmodel);
      expect(result, productmodel);
    });

    test('should throw a serverException', () async {
      when(mockclient.post(any,
              body: anyNamed('body'), headers: anyNamed('headers')))
          .thenAnswer((_) async => http.Response('something went wrong', 404));
			final call = remotedataImp.createProduct;
			expect(() => call(productmodel), throwsA(const TypeMatcher<ServerException>()));
    });
  });
}
