import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:listie/features/home/domain/entities/product_entity.dart';
import 'package:listie/features/home/presentation/views/widgets/product_details/info_card.dart';

class DraggableContainer extends StatelessWidget {
  final ProductEntity productEntity;
  const DraggableContainer({super.key, required this.productEntity});
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      maxChildSize: 0.9,
      minChildSize: 0.6,
      builder: ((context, scrollController) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r),
              topRight: Radius.circular(20.r),
            ),
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 16.h, bottom: 32.h),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          color: Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.5),
                        ),
                        height: 5.h,
                        width: 32.w,
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    productEntity.title ?? "",
                    style: const TextStyle().copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    textDirection: TextDirection.ltr,
                    maxLines: 3,
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                const Divider(),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  "Description",
                  style: const TextStyle().copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  productEntity.description ?? "",
                  style: const TextStyle().copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  overflow: TextOverflow.visible,
                  maxLines: null,
                ),
                SizedBox(
                  height: 24.h,
                ),
                InfoCard(
                  productEntity: productEntity,
                ),
                SizedBox(
                  height: 12.h,
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
