import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCarouselSlider extends StatelessWidget {
  final List<String> images;
  final CarouselSliderController controller;

  final dynamic Function(int, CarouselPageChangedReason)? onPageChanged;
  const CustomCarouselSlider({
    super.key,
    required this.images,
    required this.controller,
    this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    final height = 280.h;
    final width = MediaQuery.sizeOf(context).width;
    return CarouselSlider.builder(
      itemCount: images.length,
      carouselController: controller,
      itemBuilder: (context, index, _) {
        return Container(
          width: width,
          height: height,
          color: Theme.of(context).cardColor,
          child: CachedNetworkImage(
            width: width,
            height: height,
            fit: BoxFit.cover,
            imageUrl: images[index],
          ),
        );
      },
      options: CarouselOptions(
        height: height,
        autoPlay: false,
        autoPlayInterval: const Duration(seconds: 5),
        autoPlayAnimationDuration: const Duration(seconds: 1),
        viewportFraction: 1.0,
        onPageChanged: onPageChanged,
      ),
    );
  }
}
