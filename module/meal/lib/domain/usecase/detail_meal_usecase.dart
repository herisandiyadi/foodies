import 'package:core/common/utils/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:meal/domain/entities/detail_meal_entity.dart';
import 'package:meal/domain/repositories/list_meal_repository.dart';

class DetailMealUsecase {
  final MealRepository repository;

  DetailMealUsecase(this.repository);

  Future<Either<Failure, ListDetailMealEntity>> execute(String id) {
    final dataresp = repository.getDetailMeal(id);
    return dataresp;
  }
}
