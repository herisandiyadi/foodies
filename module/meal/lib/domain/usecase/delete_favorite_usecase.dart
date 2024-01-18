import 'package:core/common/utils/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:meal/domain/entities/favorite_item.dart';
import 'package:meal/domain/repositories/list_meal_repository.dart';

class DeleteFavoriteUsecase {
  final MealRepository repository;

  DeleteFavoriteUsecase(this.repository);

  Future<Either<Failure, String>> execute(FavoriteItem favoriteItem) {
    final dataresp = repository.deleteFavorite(favoriteItem);
    return dataresp;
  }
}
