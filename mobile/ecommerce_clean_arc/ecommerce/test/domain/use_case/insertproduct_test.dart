import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce/features/product/domain/use_cases/insertproduct.dart';
import '../../helpers/test_helper.mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ecommerce/features/product/domain/entities/product_ent.dart';

void main() {
  late MockProductRepositories mockrepo;
  late Insertproduct insertprod;

  setUp(() {
    mockrepo = MockProductRepositories();
    insertprod = Insertproduct(productrepo: mockrepo);
  });

  const product = Product(
      id: '1',
      name: 'shoe',
      price: 33,
      imageurl: 'img/b',
      description: 'a shoe');

  test(
    'This should insert to the repo',
    () async {
      when(mockrepo.createProduct(product)).thenAnswer((_) async => const Right(product));
      final result = await insertprod.call(product);
      expect(result, const Right(product));
    },
  );
}
