// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/home/data/contracts/home_remote_data_source.dart'
    as _i901;
import '../../features/home/data/data_sources/home_remote_data_source_impl.dart'
    as _i97;
import '../../features/home/data/repos/home_repo_impl.dart' as _i647;
import '../../features/home/domain/repos/home_repo.dart' as _i130;
import '../../features/home/domain/use_cases/fetch_products_use_case.dart'
    as _i148;
import '../../features/home/presentation/manager/cubit/fetch_products_cubit.dart'
    as _i3;
import '../api/api_manager/api_manager.dart' as _i680;
import '../api/api_manager/dio_module.dart' as _i456;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dioModule = _$DioModule();
    gh.lazySingleton<_i361.Dio>(() => dioModule.providerDio());
    gh.factory<_i680.ApiService>(() => _i680.ApiService(gh<_i361.Dio>()));
    gh.factory<_i901.HomeRemoteDataSource>(
        () => _i97.HomeRemoteDataSourceImp(gh<_i680.ApiService>()));
    gh.factory<_i130.HomeRepo>(
        () => _i647.HomeRepoImpl(gh<_i901.HomeRemoteDataSource>()));
    gh.factory<_i148.FetchProductsUseCase>(
        () => _i148.FetchProductsUseCase(gh<_i130.HomeRepo>()));
    gh.factory<_i3.FetchProductsCubit>(
        () => _i3.FetchProductsCubit(gh<_i148.FetchProductsUseCase>()));
    return this;
  }
}

class _$DioModule extends _i456.DioModule {}
