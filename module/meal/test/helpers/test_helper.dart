import 'package:dio/dio.dart';
import 'package:meal/data/datasource/meal_local_data_source.dart';
import 'package:meal/data/datasource/meal_remote_data_source.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

class DioMock extends Mock implements Dio {}

@GenerateMocks([
  MealRemoteDataSource,
  MealLocalDataSource,
  DioMock,
])
void main() {}
