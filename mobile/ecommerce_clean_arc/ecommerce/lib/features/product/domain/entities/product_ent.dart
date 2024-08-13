import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageurl;

  const Product(
      {required this.id,
      required this.name,
      required this.description,
      required this.price,
      required this.imageurl});

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        imageurl,
      ];
}
