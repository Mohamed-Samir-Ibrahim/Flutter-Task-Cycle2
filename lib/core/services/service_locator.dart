import 'package:dio/dio.dart';
import 'package:flutter_task_cycle2/core/usecase/base_usecase.dart';
import 'package:flutter_task_cycle2/feature/data/data_source/product_remote_data_source.dart';
import 'package:flutter_task_cycle2/feature/data/repository/product_repository_impl.dart';
import 'package:flutter_task_cycle2/feature/presentation/cubit/product_state.dart';
import 'package:get_it/get_it.dart';
import '../../feature/domain/repository/product_repository_contract.dart';
import '../../feature/domain/use_case/product_use_case.dart';
import '../../feature/presentation/cubit/product_cubit.dart';

final sl = GetIt.instance;

  void serviceLocator() {
    //cubits
    sl.registerFactory(() => ProductCubit(sl()));

    //product feature
    sl.registerLazySingleton<ProductRepositoryContract>(() => ProductRepositoryImpl(sl()));
    sl.registerLazySingleton<BaseUseCase>(() => ProductUseCase(sl()));
    //sl.registerLazySingleton(() => Dio());
    sl.registerLazySingleton<ProductRemoteDataSourceContract>(() => ProductRemoteDataSource());
  }