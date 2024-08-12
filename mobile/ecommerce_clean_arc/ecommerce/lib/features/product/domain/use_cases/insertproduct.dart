import "../entities/product_ent.dart";
import "../repositories/productrepositories.dart";


class Insertproduct{
	ProductRepositories productrepo;

	Insertproduct({required this.productrepo});

	Future<Product> call(Product product) async {
		return await productrepo.createProduct(product);
	}
}
