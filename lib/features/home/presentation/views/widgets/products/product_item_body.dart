import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:listie/core/utils/app_assets.dart';

import '../../../../../../core/utils/my_colors.dart';
import '../../../../domain/entities/product_entity.dart';

class ProductItemBody extends StatelessWidget {
  const ProductItemBody({
    super.key,
    required this.productEntity,
  });
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 7, right: 7),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            productEntity.title ?? "",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 16,
              color: textColor,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Text(
                      "EGP ${productEntity.price}",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: const TextStyle(
                        fontSize: 15,
                        color: textColor,
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Text(
                      "1500 EGP",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 12,
                        color: primaryColor.withOpacity(0.6),
                        decoration: TextDecoration.lineThrough,
                        decorationColor: primaryColor.withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 6,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    "Review (${productEntity.rating})",
                    maxLines: 1,
                    style: const TextStyle(
                      fontSize: 13,
                      color: textColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  SizedBox(
                    width: 16,
                    child: Image.asset(
                      starIconImage,
                    ),
                  ),
                ],
              ),
              InkWell(
                onTap: () {},
                splashColor: Colors.transparent,
                child: const Icon(
                  FontAwesomeIcons.circlePlus,
                  size: 35,
                  color: primaryColor,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
