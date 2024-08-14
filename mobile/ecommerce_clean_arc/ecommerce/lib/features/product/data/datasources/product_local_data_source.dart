import 'package:ecommerce/features/product/data/models/product_model.dart';


abstract class ProductLocalDataSource{
	Future<ProductModel> getLastProductModel();

	Future<void> cacheProduct(ProductModel productmodel);
}
