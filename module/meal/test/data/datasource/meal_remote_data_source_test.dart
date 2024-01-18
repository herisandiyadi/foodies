import 'dart:convert';

import 'package:core/common/utils/constant.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:meal/data/datasource/meal_remote_data_source.dart';
import 'package:meal/data/models/list_meals_response.dart';

import '../../json_reader.dart';

void main() async {
  late Dio dio;
  late DioAdapter dioAdapter;
  late MealRemoteDataSourceImpl dataSource;

  setUp(() {
    dio = Dio(BaseOptions());
    dioAdapter = DioAdapter(dio: dio);
    dataSource = MealRemoteDataSourceImpl(dio: dio);
  });
  group('Get Data Meal', () {
    final tMealList =
        ListMeal.fromJson(jsonDecode(readJson('dummy_data/list_meal.json')))
            .meals;

    test('should return list of Meal Model  when the response code is 200',
        () async {
      dioAdapter.onGet('$baseUrl/filter.php?c=chicken', (server) {
        server.reply(200, tMealList);
      });
    });

    test('should throw DioError when the response code is 404 or other',
        () async {
      dioAdapter.onGet('$baseUrl/filter.php?c=chicken', (server) {
        server.throws(404, DioException(requestOptions: RequestOptions()));
      });
    });
  });
}
