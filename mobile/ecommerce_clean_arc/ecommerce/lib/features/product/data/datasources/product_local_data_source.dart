import 'package:ecommerce/features/product/data/models/product_model.dart';
import 'package:ecommerce/features/product/domain/entities/product_ent.dart';


abstract class ProductLocalDataSource{
	Future<ProductModel> getLastProductModel();

	Future<ProductModel> cacheProduct(Product product);
}
