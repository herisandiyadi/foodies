// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class ListMealEntity extends Equatable {
  final List<MealEntity> meals;

  const ListMealEntity({required this.meals});
  @override
  List<Object?> get props => [meals];
}

class MealEntity extends Equatable {
  final String strMeal;
  final String strMealThumb;
  final String idMeal;

  const MealEntity(
      {required this.strMeal,
      required this.strMealThumb,
      required this.idMeal});
  @override
  List<Object?> get props => [
        strMeal,
        strMealThumb,
        idMeal,
      ];
}
