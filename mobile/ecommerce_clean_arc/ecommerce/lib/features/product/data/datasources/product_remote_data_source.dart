import 'package:ecommerce/features/product/data/models/product_model.dart';

abstract class ProductRemoteDataSource{
  Future<ProductModel> createProduct(ProductModel product);
  Future<ProductModel> updateProduct(ProductModel product);
  Future<void> deleteProduct(String id);
  Future<ProductModel> getProuduct(String id);
}
