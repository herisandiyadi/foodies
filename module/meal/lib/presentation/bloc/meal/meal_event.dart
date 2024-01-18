// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'meal_bloc.dart';

abstract class MealEvent extends Equatable {
  const MealEvent();

  @override
  List<Object> get props => [];
}

class FetchListMeal extends MealEvent {
  const FetchListMeal();
  @override
  List<Object> get props => [];
}

class InsertFavorite extends MealEvent {
  final FavoriteItem favoriteItem;
  const InsertFavorite(
    this.favoriteItem,
  );
  @override
  List<Object> get props => [favoriteItem];
}

class FetchAllFavorite extends MealEvent {
  const FetchAllFavorite();
  @override
  List<Object> get props => [];
}

class DeleteFavorite extends MealEvent {
  final FavoriteItem item;
  const DeleteFavorite(this.item);
  @override
  List<Object> get props => [item];
}
