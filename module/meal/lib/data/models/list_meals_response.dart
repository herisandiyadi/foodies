import 'package:meal/domain/entities/list_meals_entity.dart';

class ListMeal {
  final List<Meal> meals;

  ListMeal({
    required this.meals,
  });

  factory ListMeal.fromJson(Map<String, dynamic> json) => ListMeal(
        meals: List<Meal>.from(json["meals"].map((x) => Meal.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "meals": List<dynamic>.from(meals.map((x) => x.toJson())),
      };

  ListMealEntity toEntity() {
    return ListMealEntity(meals: meals.map((e) => e.toEntity()).toList());
  }
}

class Meal {
  final String strMeal;
  final String strMealThumb;
  final String idMeal;

  Meal({
    required this.strMeal,
    required this.strMealThumb,
    required this.idMeal,
  });

  factory Meal.fromJson(Map<String, dynamic> json) => Meal(
        strMeal: json["strMeal"],
        strMealThumb: json["strMealThumb"],
        idMeal: json["idMeal"],
      );

  Map<String, dynamic> toJson() => {
        "strMeal": strMeal,
        "strMealThumb": strMealThumb,
        "idMeal": idMeal,
      };

  MealEntity toEntity() {
    return MealEntity(
      strMeal: strMeal,
      strMealThumb: strMealThumb,
      idMeal: idMeal,
    );
  }
}
