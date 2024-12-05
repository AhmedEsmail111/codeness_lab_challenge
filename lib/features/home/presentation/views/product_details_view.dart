import 'package:flutter/material.dart';
import 'package:listie/features/home/domain/entities/product_entity.dart';
import 'package:listie/features/home/presentation/views/widgets/product_details/product_details_view_body.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, required this.productEntity});
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProductDetailsViewBody(
        productEntity: productEntity,
      ),
    );
  }
}
