import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:listie/core/Result/api_result.dart';
import 'package:listie/features/home/domain/use_cases/fetch_products_use_case.dart';

import 'fetch_products_state.dart';

@injectable
class FetchProductsCubit extends Cubit<FetchProductsStates> {
  final FetchProductsUseCase _fetchProductsUseCase;
  FetchProductsCubit(this._fetchProductsUseCase)
      : super(FetchProductsInitial());
  Future<void> fetchProducts() async {
    final result = await _fetchProductsUseCase.execute();
    switch (result) {
      case Success():
        {
          emit(FetchProductsSuccess(products: result.data!));
        }
      case Fail():
        {
          emit(
            FetchProductsFailure(result.exception),
          );
        }
    }
  }
}
