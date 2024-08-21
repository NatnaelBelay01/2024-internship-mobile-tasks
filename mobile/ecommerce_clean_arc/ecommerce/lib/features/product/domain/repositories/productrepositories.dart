import "package:ecommerce/core/error/failure.dart";

import "../entities/product_ent.dart";
import "package:dartz/dartz.dart";


abstract class ProductRepositories {
  Future<Either<Failure, Product>> createProduct(Product product);
  Future<Either<Failure, Product>> updateProduct(Product product);
  Future<Either<Failure, void>> deleteProduct(String id);
  Future<Either<Failure, Product>> getProuduct(String id);
  Future<Either<Failure, List<Product>>> getallProuduct();
}
