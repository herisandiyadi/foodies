import 'package:core/common/utils/constant.dart';
import 'package:core/common/utils/exceptions.dart';
import 'package:meal/data/models/detail_meal_response.dart';
import 'package:meal/data/models/list_meals_response.dart';

import 'package:dio/dio.dart';

abstract class MealRemoteDataSource {
  Future<ListMeal> getListMeal();
  Future<DetailMealResponse> getDetailMeal(String id);
}

class MealRemoteDataSourceImpl implements MealRemoteDataSource {
  final Dio dio;

  MealRemoteDataSourceImpl({required this.dio});

  // MealRemoteDataSourceImpl({required this.dio});
  @override
  Future<ListMeal> getListMeal() async {
    try {
      Response response = await dio.request(
        '$baseUrl/filter.php?c=chicken',
        options: Options(
          method: 'GET',
        ),
      );
      if (response.statusCode == 200) {
        return ListMeal.fromJson(response.data);
      } else {
        throw DioError(
          requestOptions: response.requestOptions,
          response: response,
        );
      }
    } catch (e) {
      throw MessageException(e.toString());
    }
  }

  @override
  Future<DetailMealResponse> getDetailMeal(String id) async {
    try {
      Response response = await dio.request(
        '$baseUrl/lookup.php?i=$id',
        options: Options(
          method: 'GET',
        ),
      );
      if (response.statusCode == 200) {
        return DetailMealResponse.fromJson(response.data);
      } else {
        throw DioError(
          requestOptions: response.requestOptions,
          response: response,
        );
      }
    } catch (e) {
      throw MessageException(e.toString());
    }
  }
}
