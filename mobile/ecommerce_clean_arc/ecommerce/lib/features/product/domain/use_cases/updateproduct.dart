import "../repositories/productrepositories.dart";
import "../entities/product_ent.dart";
import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failure.dart';


class UpdateProduct {
	final ProductRepositories productRepo;

	UpdateProduct({required this.productRepo});

	Future<Either<Failure, Product>> call(Product product) async {
		return await productRepo.updateProduct(product);
	}
}
