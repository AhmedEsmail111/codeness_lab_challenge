import 'package:flutter_test/flutter_test.dart';
import 'package:listie/core/Result/api_result.dart';
import 'package:listie/core/api/api_manager/api_manager.dart';
import 'package:listie/features/home/data/data_sources/home_remote_data_source_impl.dart';
import 'package:listie/features/home/data/models/products_response_model/products_response_model.dart';
import 'package:listie/features/home/domain/entities/product_entity.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_remote_data_source_impl_test.mocks.dart';

@GenerateMocks([ApiService])
void main() {
  late MockApiService apiService;
  late HomeRemoteDataSourceImp homeRemoteDataSourceImp;
  setUp(
    () async {
      apiService = MockApiService();
      homeRemoteDataSourceImp = HomeRemoteDataSourceImp(apiService);
    },
  );
  group(
    'fetchProducts method test',
    () {
      test(
        'When calling fetchProducts'
        'it should call apiService fetchProducts method and returns List of ProductsResponseModel',
        () async {
          // arrange
          final mockedResult = [
            ProductsResponseModel(),
            ProductsResponseModel(),
            ProductsResponseModel()
          ];
          // act
          when(
            apiService.fetchProducts(),
          ).thenAnswer(
            (_) async => mockedResult,
          );

          final actual = await homeRemoteDataSourceImp.fetchProducts();
          // assert
          verify(
            apiService.fetchProducts(),
          ).called(1);

          expect(
            actual,
            isA<Success<List<ProductEntity>>>(),
          );
        },
      );
    },
  );
}
