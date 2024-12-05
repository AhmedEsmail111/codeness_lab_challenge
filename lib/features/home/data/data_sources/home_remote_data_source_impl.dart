import 'package:injectable/injectable.dart';
import 'package:listie/core/Result/api_result.dart';
import 'package:listie/core/api/api_extentions.dart';
import 'package:listie/core/api/api_manager/api_manager.dart';
import 'package:listie/features/home/data/contracts/home_remote_data_source.dart';
import 'package:listie/features/home/domain/entities/product_entity.dart';

@Injectable(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImp implements HomeRemoteDataSource {
  final ApiService _apiService;

  HomeRemoteDataSourceImp(this._apiService);
  @override
  Future<Result<List<ProductEntity>?>> fetchProducts() async {
    return executeApi<List<ProductEntity>>(
      () async {
        final List<ProductEntity> products = [];
        final response = await _apiService.fetchProducts();
        for (final product in response) {
          products.add(product.toProductEntity());
        }
        return products;
      },
    );
  }
}
