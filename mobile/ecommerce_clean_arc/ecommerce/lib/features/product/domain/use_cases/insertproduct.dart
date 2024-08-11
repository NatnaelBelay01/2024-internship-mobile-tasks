import "../entities/product_ent.dart";
import "../repositories/productrepositories.dart";


class Insertproduct{
	ProductRepositories productrepo;

	Insertproduct({required this.productrepo});

	Product insert(Product product){
		return productrepo.createProduct(product);
	}
}
