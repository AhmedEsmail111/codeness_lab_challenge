import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:listie/features/home/data/models/products_response_model/products_response_model.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../api_constants.dart';

part 'api_manager.g.dart';

@injectable
@singleton
@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  @FactoryMethod()
  factory ApiService(Dio dio) = _ApiService;

  @GET(ApiConstants.products)
  Future<List<ProductsResponseModel>> fetchProducts();
}
