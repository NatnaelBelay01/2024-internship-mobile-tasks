import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "../entities/product_ent.dart";

abstract class ProductRepositories {
  Product createProduct(Product product);
  Product updateProduct(Product product);
  void deleteProduct(String id);
  Product getProuduct(String id);
}
