import "../repositories/productrepositories.dart";
import "../entities/product_ent.dart";


class DeleteProduct{
	final ProductRepositories productrepo;

	DeleteProduct({required this.productrepo});

	void remove(String id){
		productrepo.deleteProduct(id);
	}
}
