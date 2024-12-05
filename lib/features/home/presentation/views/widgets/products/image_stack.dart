import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:listie/core/utils/my_colors.dart';

class ImageStack extends StatefulWidget {
  final String image;
  final bool isWishlisted;
  const ImageStack({
    super.key,
    required this.image,
    required this.isWishlisted,
  });

  @override
  State<ImageStack> createState() => _ImageStackState();
}

class _ImageStackState extends State<ImageStack> {
  late bool isWishlisted;
  @override
  void initState() {
    super.initState();
    isWishlisted = widget.isWishlisted;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(
              20,
            ),
            topRight: Radius.circular(
              20,
            ),
          ),
          child: Container(
            padding: const EdgeInsets.only(top: 4),
            height: 110,
            width: double.infinity,
            child: CachedNetworkImage(
              imageUrl: widget.image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 5,
          right: 5,
          child: Container(
            width: 32,
            height: 32,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              padding: EdgeInsets.zero,
              color: primaryColor,
              iconSize: 25,
              onPressed: () {},
              icon: const Icon(
                IconlyLight.heart,
              ),
            ),
          ),
        )
      ],
    );
  }
}
