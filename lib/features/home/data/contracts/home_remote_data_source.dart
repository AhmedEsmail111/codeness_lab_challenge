import 'package:listie/core/Result/api_result.dart';
import 'package:listie/features/home/domain/entities/product_entity.dart';

abstract class HomeRemoteDataSource {
  Future<Result<List<ProductEntity>?>> fetchProducts();
}
