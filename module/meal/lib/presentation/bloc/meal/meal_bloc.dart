// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal/domain/entities/favorite_item.dart';
import 'package:meal/domain/entities/list_meals_entity.dart';
import 'package:meal/domain/usecase/delete_favorite_usecase.dart';
import 'package:meal/domain/usecase/get_all_favorite.dart';
import 'package:meal/domain/usecase/get_list_meal_usecase.dart';
import 'package:meal/domain/usecase/insert_favorite_usecase.dart';

part 'meal_event.dart';
part 'meal_state.dart';

class MealBloc extends Bloc<MealEvent, MealState> {
  final GetListMealUsecase getListMealUsecase;
  final InsertFavoriteUsecase insertFavoriteUsecase;
  final GetAllFavoriteUsecase getAllFavoriteUsecase;
  final DeleteFavoriteUsecase deleteFavoriteUsecase;
  MealBloc({
    required this.getListMealUsecase,
    required this.insertFavoriteUsecase,
    required this.getAllFavoriteUsecase,
    required this.deleteFavoriteUsecase,
  }) : super(MealInitial()) {
    on<FetchListMeal>((event, emit) async {
      emit(MealLoading());
      final result = await getListMealUsecase.execute();
      result.fold((failure) {
        emit(MealFailed(message: failure.message));
      }, (success) {
        emit(MealSuccess(listMealEntity: success));
      });
    });

    on<FetchAllFavorite>((event, emit) async {
      emit(MealLoading());
      final result = await getAllFavoriteUsecase.execute();
      result.fold((failure) {
        emit(MealFailed(message: failure.message));
      }, (success) {
        emit(GetFavoriteSuccess(favoriteItem: success));
      });
    });
  }
}
