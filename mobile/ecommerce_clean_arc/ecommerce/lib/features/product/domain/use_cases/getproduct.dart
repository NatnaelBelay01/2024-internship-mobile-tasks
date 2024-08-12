import "../repositories/productrepositories.dart";
import "../entities/product_ent.dart";


class GetProduct{
	final ProductRepositories productrepo;

	GetProduct({required this.productrepo});

	Future<Product> call(String id) async {
		return await productrepo.getProuduct(id);
	}
}
