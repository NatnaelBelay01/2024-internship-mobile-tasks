import "../repositories/productrepositories.dart";
import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failure.dart';

class DeleteProduct{
	final ProductRepositories productrepo;

	DeleteProduct({required this.productrepo});

	Future<Either<Failure, void>> call(String id) async {
		return await productrepo.deleteProduct(id);
	}
}
