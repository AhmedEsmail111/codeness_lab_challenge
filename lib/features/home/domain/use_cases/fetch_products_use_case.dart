import 'package:injectable/injectable.dart';
import 'package:listie/core/Result/api_result.dart';
import 'package:listie/features/home/domain/repos/home_repo.dart';

import '../entities/product_entity.dart';

@injectable
class FetchProductsUseCase {
  final HomeRepo _homeRepo;

  FetchProductsUseCase(this._homeRepo);

  Future<Result<List<ProductEntity>?>> execute() async {
    return await _homeRepo.fetchProducts();
  }
}
