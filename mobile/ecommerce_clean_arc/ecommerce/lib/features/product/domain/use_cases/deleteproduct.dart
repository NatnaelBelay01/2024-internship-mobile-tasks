import "../repositories/productrepositories.dart";
import "../entities/product_ent.dart";


class DeleteProduct{
	final ProductRepositories productrepo;

	DeleteProduct({required this.productrepo});

	Future<void> call(String id) async {
		await productrepo.deleteProduct(id);
	}
}
