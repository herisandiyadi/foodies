import 'package:core/common/utils/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:meal/domain/entities/favorite_item.dart';
import 'package:meal/domain/repositories/list_meal_repository.dart';

class GetAllFavoriteUsecase {
  final MealRepository repository;

  GetAllFavoriteUsecase(this.repository);

  Future<Either<Failure, List<FavoriteItem>>> execute() {
    final dataresp = repository.getAllFavorite();
    return dataresp;
  }
}
