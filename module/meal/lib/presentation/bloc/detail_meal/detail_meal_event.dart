part of 'detail_meal_bloc.dart';

abstract class DetailMealEvent extends Equatable {
  const DetailMealEvent();

  @override
  List<Object> get props => [];
}

class FetchDetailMeal extends DetailMealEvent {
  final String id;

  const FetchDetailMeal({required this.id});

  @override
  List<Object> get props => [id];
}

class InsertFavoriteMeal extends DetailMealEvent {
  final FavoriteItem favoriteItem;
  const InsertFavoriteMeal(
    this.favoriteItem,
  );
  @override
  List<Object> get props => [favoriteItem];
}

class RemoveFavoriteMeal extends DetailMealEvent {
  final FavoriteItem favoriteItem;
  const RemoveFavoriteMeal(
    this.favoriteItem,
  );
  @override
  List<Object> get props => [favoriteItem];
}

class StatusFavoriteMeal extends DetailMealEvent {
  final String idMeal;
  const StatusFavoriteMeal(
    this.idMeal,
  );
  @override
  List<Object> get props => [idMeal];
}
