import 'package:core/common/utils/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:meal/domain/entities/detail_meal_entity.dart';
import 'package:meal/domain/entities/favorite_item.dart';
import 'package:meal/domain/entities/list_meals_entity.dart';

abstract class MealRepository {
  Future<Either<Failure, ListMealEntity>> getListMeal();
  Future<Either<Failure, ListDetailMealEntity>> getDetailMeal(String id);
  Future<Either<Failure, String>> insertToFavorite(FavoriteItem favoriteItem);
  Future<Either<Failure, List<FavoriteItem>>> getAllFavorite();
  Future<Either<Failure, String>> deleteFavorite(FavoriteItem item);
  Future<bool> isFavorite(String idMeal);
}
