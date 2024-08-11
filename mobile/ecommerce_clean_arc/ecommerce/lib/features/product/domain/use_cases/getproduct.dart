import "../repositories/productrepositories.dart";
import "../entities/product_ent.dart";


class GetProduct{
	final ProductRepositories productrepo;

	GetProduct({required this.productrepo});

	Product getpro(String id){
		return productrepo.getProuduct(id);
	}
}
