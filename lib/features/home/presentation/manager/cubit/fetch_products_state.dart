import 'package:flutter/material.dart';

import '../../../domain/entities/product_entity.dart';

@immutable
sealed class FetchProductsStates {}

final class FetchProductsInitial extends FetchProductsStates {}

final class FetchProductsSuccess extends FetchProductsStates {
  final List<ProductEntity> products;

  FetchProductsSuccess({required this.products});
}

final class FetchProductsFailure extends FetchProductsStates {
  final Exception exception;

  FetchProductsFailure(this.exception);
}
