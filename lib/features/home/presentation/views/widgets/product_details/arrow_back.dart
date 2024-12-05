import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:listie/core/utils/my_colors.dart';

class ArrowBack extends StatelessWidget {
  const ArrowBack({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.all(16.w),
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          // GoRouter.of(context).pop();
        },
        child: Container(
          padding: EdgeInsetsDirectional.only(start: 8.w),
          clipBehavior: Clip.hardEdge,
          width: 55.w,
          height: 55.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.r),
            color: secondaryColor,
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.w, sigmaY: 10.w),
            child: Container(
              width: 55.w,
              height: 55.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.r),
              ),
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
