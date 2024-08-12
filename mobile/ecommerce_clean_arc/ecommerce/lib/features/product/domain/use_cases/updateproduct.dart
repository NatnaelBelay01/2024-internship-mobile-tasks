import "../repositories/productrepositories.dart";
import "../entities/product_ent.dart";

class UpdateProduct {
	final ProductRepositories productRepo;

	UpdateProduct({required this.productRepo});

	Future<Product> call(Product product) async {
		return await productRepo.updateProduct(product);
	}
}
