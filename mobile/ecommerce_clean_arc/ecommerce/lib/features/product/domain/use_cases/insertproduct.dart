import "package:ecommerce/core/error/failure.dart";
import "package:dartz/dartz.dart";
import "../entities/product_ent.dart";
import "../repositories/productrepositories.dart";


class Insertproduct{
	ProductRepositories productrepo;

	Insertproduct({required this.productrepo});

	Future<Either<Failure, Product>> call(Product product) async {
		return await productrepo.createProduct(product);
	}
}
