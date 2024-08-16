import 'dart:convert';
import 'package:ecommerce/core/error/exception.dart';
import 'package:ecommerce/features/product/data/models/product_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:ecommerce/features/product/data/datasources/product_local_data_source.dart';

import '../../fixtures/fixture.dart';
import '../../helpers/repo_mocks/shared_prefs/test_helper.mocks.dart';

void main() {
  late MockSharedPreferences mockshared;
  late ProductLocalDataSourceImpl localdata;
  late ProductModel productmodel;
  setUp(() {
    mockshared = MockSharedPreferences();
    localdata = ProductLocalDataSourceImpl(sharedPreferences: mockshared);
    productmodel = const ProductModel(
      id: "01",
      name: "shoe",
      description: "a shoe",
      imageurl: "img/b.jpg",
      price: 34,
    );
  });
 
  group('get last product', () {
    test('should return the last product that is stored in the cache',
        () async {
      when(mockshared.getString(any)).thenReturn(fixture('product.json'));
      final result = await localdata.getLastProductModel();
      expect(result, equals(productmodel));
    });
		
		test('Should throw an exception when there is no cache', () async {
			when(mockshared.getString(any)).thenReturn(null);
			final call = localdata.getLastProductModel;
			
			expect(() => call(), throwsA(const TypeMatcher<CacheException>()));
		});
  });

	group('Cache product', (){
		test('Should call shared preferences to cache data', () async {
			final expected = json.encode(productmodel.toJson());
			when(mockshared.setString(CACHE, expected)).thenAnswer((_) async => true);
			localdata.cacheProduct(productmodel);
			verify(mockshared.setString(CACHE, expected));
		});
	});
}
