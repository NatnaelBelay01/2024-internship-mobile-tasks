import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/exception.dart';
import 'package:ecommerce/features/product/data/models/product_model.dart';
import 'package:ecommerce/features/product/domain/repositories/productrepositories.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/features/product/domain/entities/product_ent.dart';
import 'package:ecommerce/features/product/data/datasources/product_local_data_source.dart';
import 'package:ecommerce/features/product/data/datasources/product_remote_data_source.dart';
import 'package:ecommerce/core/platform/network_info.dart';

class ProductRepositoryImp implements ProductRepositories {
  final ProductLocalDataSource localdatasource;
  final ProductRemoteDataSource remotedatasource;
  final NetworkInfo networkinfo;

  ProductRepositoryImp({
    required this.localdatasource,
    required this.remotedatasource,
    required this.networkinfo,
  });

  @override
  Future<Either<Failure, Product>> createProduct(Product product) async {
    if (await networkinfo.isConnected) {
      try {
        ProductModel result = await remotedatasource.createProduct(product);
        localdatasource.cacheProduct(result);
        Product newProduct = Product(
          id: result.id,
          name: result.name,
          description: result.description,
          price: result.price,
          imageurl: result.imageurl,
        );
        return Right(newProduct);
      } on ServerException {
        return const Left(ServerFailure());
      }
    } else {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Product>> updateProduct(Product product) async {
    if (await networkinfo.isConnected) {
      try {
        ProductModel result = await remotedatasource.updateProduct(product);
        localdatasource.cacheProduct(result);
        Product newProduct = Product(
          id: result.id,
          name: result.name,
          description: result.description,
          price: result.price,
          imageurl: result.imageurl,
        );
        return Right(newProduct);
      } on ServerException {
        return const Left(ServerFailure());
      }
    } else {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteProduct(String id) async {
    if (await networkinfo.isConnected) {
      try {
        await remotedatasource.getProuduct(id);
        return const Right(null);
      } on ServerException {
        return const Left(ServerFailure());
      }
    } else {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Product>> getProuduct(String id) async {
    if (await networkinfo.isConnected) {
      try {
        ProductModel result = await remotedatasource.getProuduct(id);
        localdatasource.cacheProduct(result);
        Product newProduct = Product(
          id: result.id,
          name: result.name,
          description: result.description,
          price: result.price,
          imageurl: result.imageurl,
        );
        return Right(newProduct);
      } on ServerException {
        return const Left(ServerFailure());
      }
    } else {
      try {
        final result = await localdatasource.getLastProductModel();
        return Right(Product(
          id: result.id,
          name: result.name,
          description: result.description,
          price: result.price,
          imageurl: result.imageurl,
        ));
      } on CacheException {
        return const Left(CacheFailure());
      }
    }
  }
}
