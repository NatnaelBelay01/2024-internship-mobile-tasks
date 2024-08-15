// Mocks generated by Mockito 5.4.4 from annotations
// in ecommerce/test/helpers/repo_mocks/local/test_helper.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:ecommerce/features/product/data/datasources/product_local_data_source.dart'
    as _i3;
import 'package:ecommerce/features/product/data/models/product_model.dart'
    as _i2;
import 'package:ecommerce/features/product/domain/entities/product_ent.dart'
    as _i5;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeProductModel_0 extends _i1.SmartFake implements _i2.ProductModel {
  _FakeProductModel_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [ProductLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockProductLocalDataSource extends _i1.Mock
    implements _i3.ProductLocalDataSource {
  MockProductLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.ProductModel> getLastProductModel() => (super.noSuchMethod(
        Invocation.method(
          #getLastProductModel,
          [],
        ),
        returnValue: _i4.Future<_i2.ProductModel>.value(_FakeProductModel_0(
          this,
          Invocation.method(
            #getLastProductModel,
            [],
          ),
        )),
      ) as _i4.Future<_i2.ProductModel>);

  @override
  _i4.Future<_i2.ProductModel> cacheProduct(_i5.Product? product) =>
      (super.noSuchMethod(
        Invocation.method(
          #cacheProduct,
          [product],
        ),
        returnValue: _i4.Future<_i2.ProductModel>.value(_FakeProductModel_0(
          this,
          Invocation.method(
            #cacheProduct,
            [product],
          ),
        )),
      ) as _i4.Future<_i2.ProductModel>);
}
