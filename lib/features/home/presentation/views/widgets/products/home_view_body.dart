import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:listie/features/home/presentation/views/widgets/products/products_grid_view_bloc_concumer.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const ProductsGridViewBlocConsumer();
  }
}
