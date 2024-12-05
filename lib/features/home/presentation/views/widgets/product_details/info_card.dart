import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:listie/core/utils/my_colors.dart';
import 'package:listie/features/home/domain/entities/product_entity.dart';

class InfoCard extends StatelessWidget {
  InfoCard({
    super.key,
    required this.productEntity,
  });

  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color.fromARGB(255, 246, 243, 243),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 16.w,
              right: 16.w,
              top: 16.w,
              bottom: 8.w,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Product Details",
                  style: const TextStyle().copyWith(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Icon(
                  Icons.info,
                  color: primaryColor,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 12.w,
            ),
            child: const Divider(),
          ),
          SizedBox(
            height: 8.h,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 16.w,
              right: 16.w,
              bottom: 16.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Category:  ',
                    style: style15,
                    children: [
                      TextSpan(
                        text: productEntity.category,
                        style: style14,
                      ),
                    ],
                  ),
                ),
                const Divider(),
                RichText(
                  text: TextSpan(
                    text: 'Rating:  ',
                    style: style15,
                    children: [
                      TextSpan(
                        text: "${productEntity.rating.toString()} average rate",
                        style: style14,
                      ),
                    ],
                  ),
                ),
                const Divider(),
                RichText(
                  text: TextSpan(
                    text: 'Price:  ',
                    style: style15,
                    children: [
                      TextSpan(
                        text: "${productEntity.price?.toStringAsFixed(2)}\$",
                        style: style14,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  TextStyle style15 = const TextStyle().copyWith(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );
  TextStyle style14 = const TextStyle().copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
}
