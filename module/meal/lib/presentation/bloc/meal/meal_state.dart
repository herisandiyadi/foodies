part of 'meal_bloc.dart';

abstract class MealState extends Equatable {
  const MealState();

  @override
  List<Object> get props => [];
}

final class MealInitial extends MealState {}

final class MealFailed extends MealState {
  final String message;

  const MealFailed({required this.message});
  @override
  List<Object> get props => [message];
}

final class MealLoading extends MealState {}

final class MealSuccess extends MealState {
  final ListMealEntity listMealEntity;

  const MealSuccess({
    required this.listMealEntity,
  });

  @override
  List<Object> get props => [
        listMealEntity,
      ];
}

final class InsertFavoriteSuccess extends MealState {
  final String message;

  const InsertFavoriteSuccess({required this.message});
  @override
  List<Object> get props => [message];
}

final class DeleteFavoriteSuccess extends MealState {
  final String message;

  const DeleteFavoriteSuccess({required this.message});
  @override
  List<Object> get props => [message];
}

final class GetFavoriteSuccess extends MealState {
  final List<FavoriteItem> favoriteItem;

  const GetFavoriteSuccess({required this.favoriteItem});

  @override
  List<Object> get props => [favoriteItem];
}
