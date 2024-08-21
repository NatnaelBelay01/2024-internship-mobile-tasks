import 'package:ecommerce/features/product/domain/entities/product_ent.dart';
import 'package:equatable/equatable.dart';



abstract class ProductEvent extends Equatable {


	@override
	List<Object?> get props => [];
}


class GetSingleProductEvent implements ProductEvent{
	
	final String productId;
	GetSingleProductEvent({required this.productId});


  @override
  bool? get stringify => false;

  @override
  List<Object?> get props => [];
}

class DeleteProductEvent implements ProductEvent{
	final String productId;

	DeleteProductEvent({required this.productId});

  @override
  List<Object?> get props => [productId];

  @override
  bool? get stringify => throw UnimplementedError();
}

class CreateProductEvent implements ProductEvent{
	final Product product;

	CreateProductEvent({required this.product});

  @override
  List<Object?> get props => [product];

  @override
  bool? get stringify => throw UnimplementedError();

}

class UpdateProductEvent implements ProductEvent{
	final Product product;

	UpdateProductEvent({required this.product});

  @override
  List<Object?> get props => [product];

  @override
  bool? get stringify => throw UnimplementedError();
}
