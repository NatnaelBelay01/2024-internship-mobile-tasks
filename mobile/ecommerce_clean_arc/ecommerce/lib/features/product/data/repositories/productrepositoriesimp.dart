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
  NetworkInfo networkinfo;

  ProductRepositoryImp({
    required this.localdatasource,
    required this.remotedatasource,
    required this.networkinfo,
  });

  ProductModel changeToProductModel(Product product) {
    return ProductModel(
      id: product.id,
      name: product.name,
      description: product.description,
      imageurl: product.imageurl,
      price: product.price,
    );
  }

	Product changetoEntity(ProductModel product){
    return Product(
      id: product.id,
      name: product.name,
      description: product.description,
      imageurl: product.imageurl,
      price: product.price,
    );
	}

  @override
  Future<Either<Failure, Product>> createProduct(Product product) async {
    if (await networkinfo.isConnected) {
      try {
        ProductModel result = await remotedatasource.createProduct(changeToProductModel(product));
        localdatasource.cacheProduct(result);
				Product newProduct = changetoEntity(result);
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
        ProductModel result = await remotedatasource.updateProduct(changeToProductModel(product));
        localdatasource.cacheProduct(result);
        Product newProduct = changetoEntity(result);
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
        await remotedatasource.deleteProduct(id);
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
        Product newProduct = changetoEntity(result);
        return Right(newProduct);
      } on ServerException {
        return const Left(ServerFailure());
      }
    } else {
      try {
        final result = await localdatasource.getLastProductModel();
				return Right(changetoEntity(result));
      } on CacheException {
        return const Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getallProuduct() async {
	
    if (await networkinfo.isConnected) {
      try {
        List<ProductModel> result = await remotedatasource.getallProuduct();
        List<Product> newProduct = result.map((value) => changetoEntity(value)).toList();
        return Right(newProduct);
      } on ServerException {
        return const Left(ServerFailure());
      }
    } else {
			return const Left(ServerFailure());
    }
  }
}
