import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listie/core/di/di.dart';
import 'package:listie/core/functions/helper_functions.dart';
import 'package:listie/core/utils/my_colors.dart';
import 'package:listie/features/home/presentation/manager/cubit/fetch_products_cubit.dart';
import 'package:listie/features/home/presentation/manager/cubit/fetch_products_state.dart';
import 'package:listie/features/home/presentation/views/widgets/products/loading_progress.dart';

import '../../../../domain/entities/product_entity.dart';
import 'product_item.dart';

class ProductsGridViewBlocConsumer extends StatefulWidget {
  const ProductsGridViewBlocConsumer({super.key});

  @override
  State<ProductsGridViewBlocConsumer> createState() =>
      _ProductsGridViewBlocConsumerState();
}

class _ProductsGridViewBlocConsumerState
    extends State<ProductsGridViewBlocConsumer> {
  final List<ProductEntity> products = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FetchProductsCubit, FetchProductsStates>(
      listener: (context, state) {
        if (state is FetchProductsSuccess) {
          products.clear();
          products.addAll(state.products);
          log(products.length.toString());
        }
        if (state is FetchProductsFailure) {
          final errorMessage = extractErrorMessage(state.exception);
          showErrorToast(
            context: context,
            message: errorMessage,
          );
        }
      },
      builder: (context, state) {
        return products.isNotEmpty
            ? RefreshIndicator(
                onRefresh: () {
                  return getIt<FetchProductsCubit>().fetchProducts();
                },
                backgroundColor: Colors.white,
                color: primaryColor,
                child: GridView.builder(
                  padding: const EdgeInsets.only(
                    top: 24,
                    bottom: 16,
                    left: 10,
                    right: 10,
                  ),
                  itemCount: products.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.85,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 18,
                  ),
                  itemBuilder: (context, index) => ProductItem(
                    productEntity: products[index],
                  ),
                ),
              )
            : const LoadingProgress();
      },
    );
  }
}
