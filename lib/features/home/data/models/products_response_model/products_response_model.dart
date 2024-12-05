import 'package:listie/features/home/domain/entities/product_entity.dart';

import 'rating.dart';

class ProductsResponseModel {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;

  ProductsResponseModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  });

  factory ProductsResponseModel.fromJson(Map<String, dynamic> json) =>
      ProductsResponseModel(
        id: json['id'] as int?,
        title: json['title'] as String?,
        price: (json['price'] as num?)?.toDouble(),
        description: json['description'] as String?,
        category: json['category'] as String?,
        image: json['image'] as String?,
        rating: json['rating'] == null
            ? null
            : Rating.fromJson(json['rating'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'price': price,
        'description': description,
        'category': category,
        'image': image,
        'rating': rating?.toJson(),
      };

  ProductEntity toProductEntity() {
    return ProductEntity(
      id: id,
      title: title,
      description: description,
      category: category,
      image: image,
      rating: rating?.rate,
      price: price,
    );
  }
}
