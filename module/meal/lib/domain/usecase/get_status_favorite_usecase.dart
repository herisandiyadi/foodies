import 'package:meal/domain/repositories/list_meal_repository.dart';

class GetStatusFavoriteUsecase {
  final MealRepository repository;

  GetStatusFavoriteUsecase(this.repository);

  Future<bool> execute(String idMeal) {
    final dataresp = repository.isFavorite(idMeal);
    return dataresp;
  }
}
