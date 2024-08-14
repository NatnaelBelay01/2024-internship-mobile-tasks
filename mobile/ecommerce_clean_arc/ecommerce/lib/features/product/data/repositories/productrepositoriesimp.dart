import 'package:dartz/dartz.dart';
import 'package:ecommerce/features/product/domain/repositories/productrepositories.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/features/product/domain/entities/product_ent.dart';
import 'package:ecommerce/features/product/data/datasources/product_local_data_source.dart';
import 'package:ecommerce/features/product/data/datasources/product_remote_data_source.dart';
import 'package:ecommerce/core/platform/network_info.dart';


class ProductRepositoryImp implements ProductRepositories{
	
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
		return Right(product);
	}

	@override
  Future<Either<Failure, Product>> updateProduct(Product product) async {
		return Right(product);
	}

	@override
  Future<Either<Failure, void>> deleteProduct(String id) async {
		return const Right(null);
	}

	@override
  Future<Either<Failure, Product>> getProuduct(String id) async {
		return Right(Product(id: id, name: 'name', description: 'des', price: 0, imageurl: 'img'));
	}
} 
