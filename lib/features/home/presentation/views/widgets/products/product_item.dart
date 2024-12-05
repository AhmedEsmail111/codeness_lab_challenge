import 'package:flutter/material.dart';
import 'package:listie/features/home/domain/entities/product_entity.dart';
import 'package:listie/features/home/presentation/views/product_details_view.dart';

import '../../../../../../core/utils/my_colors.dart';
import 'image_stack.dart';
import 'product_item_body.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.productEntity});
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ProductDetailsView(productEntity: productEntity),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: primaryColor.withOpacity(0.5),
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageStack(
              image: productEntity.image.toString(),
              isWishlisted: false,
            ),
            const SizedBox(
              height: 7,
            ),
            ProductItemBody(
              productEntity: productEntity,
            )
          ],
        ),
      ),
    );
  }
}
