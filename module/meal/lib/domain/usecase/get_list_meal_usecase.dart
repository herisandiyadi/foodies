import 'package:core/common/utils/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:meal/domain/entities/list_meals_entity.dart';
import 'package:meal/domain/repositories/list_meal_repository.dart';

class GetListMealUsecase {
  final MealRepository repository;

  GetListMealUsecase(this.repository);

  Future<Either<Failure, ListMealEntity>> execute() {
    final dataresp = repository.getListMeal();
    return dataresp;
  }
}
