import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "../entities/product_ent.dart";

abstract class ProductRepositories {
  Future<Product> createProduct(Product product);
  Future<Product> updateProduct(Product product);
  Future<void> deleteProduct(String id);
  Future<Product> getProuduct(String id);
}
