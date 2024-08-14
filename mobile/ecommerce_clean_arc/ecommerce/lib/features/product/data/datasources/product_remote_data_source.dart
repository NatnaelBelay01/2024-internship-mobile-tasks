import 'package:ecommerce/features/product/data/models/product_model.dart';
import 'package:ecommerce/features/product/domain/entities/product_ent.dart';

abstract class ProductRemoteDataSource{
  Future<ProductModel> createProduct(Product product);
  Future<Product> updateProduct(Product product);
  Future<void> deleteProduct(String id);
  Future<Product> getProuduct(String id);
}
