import '../../data/models/products_response_model/products_response_model.dart';

class ProductEntity {
  final int? id;
  final String? title;

  final String? description;
  final String? category;
  final String? image;
  final double? rating, price;

  ProductEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
    required this.price,
  });

  factory ProductEntity.fromModel(ProductsResponseModel model) {
    return ProductEntity(
      id: model.id!,
      title: model.title!,
      description: model.description!,
      category: model.category!,
      image: model.image!,
      rating: model.rating!.rate!,
      price: model.price!,
    );
  }
}
