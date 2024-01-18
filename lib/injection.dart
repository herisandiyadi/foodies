import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:meal/data/datasource/meal_local_data_source.dart';
import 'package:meal/data/datasource/meal_remote_data_source.dart';
import 'package:meal/data/repositories/list_meal_repository_impl.dart';
import 'package:meal/domain/repositories/list_meal_repository.dart';
import 'package:meal/domain/usecase/delete_favorite_usecase.dart';
import 'package:meal/domain/usecase/detail_meal_usecase.dart';
import 'package:meal/domain/usecase/get_all_favorite.dart';
import 'package:meal/domain/usecase/get_list_meal_usecase.dart';
import 'package:meal/domain/usecase/get_status_favorite_usecase.dart';
import 'package:meal/domain/usecase/insert_favorite_usecase.dart';
import 'package:meal/presentation/bloc/detail_meal/detail_meal_bloc.dart';
import 'package:meal/presentation/bloc/meal/meal_bloc.dart';
import 'package:meal/presentation/bloc/page/page_bloc.dart';

final locator = GetIt.instance;

void init() {
  locator.registerLazySingleton<MealRemoteDataSource>(
      () => MealRemoteDataSourceImpl(dio: locator()));
  locator.registerLazySingleton<MealLocalDataSource>(
      () => MealLocalDataSourceImpl());

  locator.registerLazySingleton<MealRepository>(
    () => MealRepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
    ),
  );

  locator.registerLazySingleton(() => GetListMealUsecase(locator()));
  locator.registerLazySingleton(() => InsertFavoriteUsecase(locator()));
  locator.registerLazySingleton(() => GetAllFavoriteUsecase(locator()));
  locator.registerLazySingleton(() => DeleteFavoriteUsecase(locator()));
  locator.registerLazySingleton(() => DetailMealUsecase(locator()));
  locator.registerLazySingleton(() => GetStatusFavoriteUsecase(locator()));

  locator.registerFactory(() => MealBloc(
        getListMealUsecase: locator(),
        insertFavoriteUsecase: locator(),
        getAllFavoriteUsecase: locator(),
        deleteFavoriteUsecase: locator(),
      ));

  locator.registerFactory(() => DetailMealBloc(
        detailMealUsecase: locator(),
        insertFavoriteUsecase: locator(),
        deleteFavoriteUsecase: locator(),
        getStatusFavoriteUsecase: locator(),
      ));
  locator.registerFactory(() => PageBloc());

  //external

  locator.registerLazySingleton(() => Dio());
}
