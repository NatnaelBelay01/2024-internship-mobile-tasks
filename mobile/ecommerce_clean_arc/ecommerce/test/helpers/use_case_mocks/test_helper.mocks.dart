// Mocks generated by Mockito 5.4.4 from annotations
// in ecommerce/test/helpers/use_case_mocks/test_helper.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:dartz/dartz.dart' as _i3;
import 'package:ecommerce/core/error/failure.dart' as _i6;
import 'package:ecommerce/features/product/domain/entities/product_ent.dart'
    as _i7;
import 'package:ecommerce/features/product/domain/repositories/productrepositories.dart'
    as _i2;
import 'package:ecommerce/features/product/domain/use_cases/getproduct.dart'
    as _i4;
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

class _FakeProductRepositories_0 extends _i1.SmartFake
    implements _i2.ProductRepositories {
  _FakeProductRepositories_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEither_1<L, R> extends _i1.SmartFake implements _i3.Either<L, R> {
  _FakeEither_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [GetProduct].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetProduct extends _i1.Mock implements _i4.GetProduct {
  MockGetProduct() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.ProductRepositories get productrepo => (super.noSuchMethod(
        Invocation.getter(#productrepo),
        returnValue: _FakeProductRepositories_0(
          this,
          Invocation.getter(#productrepo),
        ),
      ) as _i2.ProductRepositories);

  @override
  _i5.Future<_i3.Either<_i6.Failure, _i7.Product>> call(String? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [id],
        ),
        returnValue: _i5.Future<_i3.Either<_i6.Failure, _i7.Product>>.value(
            _FakeEither_1<_i6.Failure, _i7.Product>(
          this,
          Invocation.method(
            #call,
            [id],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.Failure, _i7.Product>>);
}
