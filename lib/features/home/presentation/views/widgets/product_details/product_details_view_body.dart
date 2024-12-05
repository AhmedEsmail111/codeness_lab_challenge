import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:listie/features/home/domain/entities/product_entity.dart';
import 'package:listie/features/home/presentation/views/widgets/product_details/arrow_back.dart';
import 'package:listie/features/home/presentation/views/widgets/product_details/carousel_slider.dart';
import 'package:listie/features/home/presentation/views/widgets/product_details/custom_indicator.dart';
import 'package:listie/features/home/presentation/views/widgets/product_details/draggable_container.dart';

class ProductDetailsViewBody extends StatefulWidget {
  const ProductDetailsViewBody({super.key, required this.productEntity});
  final ProductEntity productEntity;
  @override
  State<ProductDetailsViewBody> createState() => _ProductDetailsViewBodyState();
}

class _ProductDetailsViewBodyState extends State<ProductDetailsViewBody> {
  late final CarouselSliderController _sliderController;
  int sliderIndex = 1;
  @override
  void initState() {
    super.initState();
    _sliderController = CarouselSliderController();
  }

  @override
  Widget build(BuildContext context) {
    final images = [
      widget.productEntity.image!,
      widget.productEntity.image!,
      widget.productEntity.image!,
    ];
    return SafeArea(
      child: Stack(
        children: [
          CustomCarouselSlider(
            images: images,
            controller: _sliderController,
            onPageChanged: (index, _) {
              sliderIndex = index;
              setState(() {});
            },
          ),
          const ArrowBack(),
          Positioned(
            width: MediaQuery.of(context).size.width,
            top: 275,
            child: Center(
              child: CustomIndicator(
                numberOfIndicators: images,
                controller: _sliderController,
                sliderIndex: sliderIndex,
                smoothColor: 0.6,
              ),
            ),
          ),
          DraggableContainer(
            productEntity: widget.productEntity,
          )
        ],
      ),
    );
  }
}
