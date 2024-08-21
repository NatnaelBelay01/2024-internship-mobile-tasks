import "../repositories/productrepositories.dart";
import "../entities/product_ent.dart";
import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failure.dart';
class GetAllProduct{
	final ProductRepositories productrepo;

	GetAllProduct({required this.productrepo});

	Future<Either<Failure, List<Product>>> call() async {
		return await productrepo.getallProuduct();
	}
}
