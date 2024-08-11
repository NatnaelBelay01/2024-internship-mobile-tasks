import "../repositories/productrepositories.dart";
import "../entities/product_ent.dart";

class UpdateProduct {
	final ProductRepositories productRepo;

	UpdateProduct({required this.productRepo});

	Product update(Product product){
		return productRepo.updateProduct(product);
	}
}
