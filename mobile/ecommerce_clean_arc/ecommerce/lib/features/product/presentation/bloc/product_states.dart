import 'package:ecommerce/features/product/domain/entities/product_ent.dart';
import 'package:equatable/equatable.dart';



abstract class ProductStates extends Equatable {

}


class InitialState extends ProductStates {
  @override
  List<Object?> get props => [];

}


class LoadingState extends ProductStates{
  @override
  List<Object?> get props => [];
}

class LoadedAllProduct extends ProductStates{
	final List<Product> allProducts;
	LoadedAllProduct({required this.allProducts});

  @override
  List<Object?> get props => [];
}

class CreateProductState extends ProductStates{
	final Product product;
	CreateProductState({required this.product});
	@override
	List<Object?> get props => [];
}

class LoadedSingleProduct extends ProductStates{
	final Product product;
	LoadedSingleProduct({required this.product});
  @override
  List<Object?> get props => [];

}

class ErrorState extends ProductStates{
  @override
  List<Object?> get props => []; 

}
