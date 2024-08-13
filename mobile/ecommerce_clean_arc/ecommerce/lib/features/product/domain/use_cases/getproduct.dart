import "../repositories/productrepositories.dart";
import "../entities/product_ent.dart";
import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failure.dart';
class GetProduct{
	final ProductRepositories productrepo;

	GetProduct({required this.productrepo});

	Future<Either<Failure, Product>> call(String id) async {
		return await productrepo.getProuduct(id);
	}
}
