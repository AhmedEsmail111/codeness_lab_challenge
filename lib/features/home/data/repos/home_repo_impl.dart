import 'package:injectable/injectable.dart';
import 'package:listie/core/Result/api_result.dart';
import 'package:listie/features/home/data/contracts/home_remote_data_source.dart';
import 'package:listie/features/home/domain/entities/product_entity.dart';
import 'package:listie/features/home/domain/repos/home_repo.dart';

@Injectable(as: HomeRepo)
class HomeRepoImpl implements HomeRepo {
  final HomeRemoteDataSource _remoteDataSource;

  HomeRepoImpl(this._remoteDataSource);
  @override
  Future<Result<List<ProductEntity>?>> fetchProducts() async {
    return _remoteDataSource.fetchProducts();
  }
}
