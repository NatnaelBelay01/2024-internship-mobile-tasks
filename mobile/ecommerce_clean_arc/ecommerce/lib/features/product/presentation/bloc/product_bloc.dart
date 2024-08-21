import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/features/product/domain/entities/product_ent.dart';
import 'package:ecommerce/features/product/domain/use_cases/deleteproduct.dart';
import 'package:ecommerce/features/product/domain/use_cases/getproduct.dart';
import 'package:ecommerce/features/product/domain/use_cases/updateproduct.dart';
import 'package:ecommerce/features/product/domain/use_cases/insertproduct.dart';
import 'package:ecommerce/features/product/domain/use_cases/getallproduct.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './product_event.dart';
import './product_states.dart';

class ProductBloc extends Bloc<ProductEvent, ProductStates> {
  final GetProduct getProduct;
  final UpdateProduct updateProduct;
  final Insertproduct createProduct;
  final DeleteProduct deleteProduct;
  final GetAllProduct getallProduct;

  ProductBloc({
    required this.getProduct,
    required this.updateProduct,
    required this.createProduct,
    required this.deleteProduct,
    required this.getallProduct,
  }) : super(InitialState()) {
    on<GetSingleProductEvent>((event, emit) async {
      emit(LoadingState());
      final result = await getProduct.call(event.productId);

      result.fold((Failure fail) {
        emit(ErrorState());
      }, (Product product) {
        emit(LoadedSingleProduct(product: product));
      });
    });

    on<UpdateProductEvent>((event, emit) async {
      emit(LoadingState());
      final result = await updateProduct.call(event.product);

      result.fold((Failure faliure) {
        emit(ErrorState());
      }, (Product product) {
        emit(LoadedSingleProduct(product: product));
      });
    });

    on<CreateProductEvent>((event, emit) async {
      emit(LoadingState());
      final result = await createProduct.call(event.product);

      result.fold((Failure failure) {
        emit(ErrorState());
      }, (data) async {
        final newResult = await getallProduct();
        newResult.fold((Failure fail) {
          emit(ErrorState());
        }, (List<Product> prod) {
          emit(LoadedAllProduct(allProducts: prod));
        });
      });
    });

    on<DeleteProductEvent>((event, emit) async {
      emit(LoadingState());
      final result = await deleteProduct.call(event.productId);

      result.fold((Failure failure) {
        emit(ErrorState());
      }, (data) async {
        final newResult = await getallProduct();
        newResult.fold((Failure fail) {
          emit(ErrorState());
        }, (List<Product> prod) {
          emit(LoadedAllProduct(allProducts: prod));
        });
      });
    });
  }
}
