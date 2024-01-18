// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:core/common/utils/state_enum.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal/domain/entities/detail_meal_entity.dart';
import 'package:meal/domain/entities/favorite_item.dart';
import 'package:meal/domain/usecase/delete_favorite_usecase.dart';
import 'package:meal/domain/usecase/detail_meal_usecase.dart';
import 'package:meal/domain/usecase/get_status_favorite_usecase.dart';
import 'package:meal/domain/usecase/insert_favorite_usecase.dart';

part 'detail_meal_event.dart';
part 'detail_meal_state.dart';

class DetailMealBloc extends Bloc<DetailMealEvent, DetailMealState> {
  final DetailMealUsecase detailMealUsecase;
  final InsertFavoriteUsecase insertFavoriteUsecase;
  final DeleteFavoriteUsecase deleteFavoriteUsecase;
  final GetStatusFavoriteUsecase getStatusFavoriteUsecase;
  DetailMealBloc({
    required this.detailMealUsecase,
    required this.insertFavoriteUsecase,
    required this.deleteFavoriteUsecase,
    required this.getStatusFavoriteUsecase,
  }) : super(DetailMealState.initial()) {
    on<FetchDetailMeal>((event, emit) async {
      emit(state.copyWith(detailState: RequestState.Loading));
      final result = await detailMealUsecase.execute(event.id);
      result.fold((failure) {
        emit(
          state.copyWith(
            detailState: RequestState.Error,
          ),
        );
      }, (detail) {
        emit(state.copyWith(
            detailState: RequestState.Loaded, listDetailMealEntity: detail));
      });
    });

    on<InsertFavoriteMeal>((event, emit) async {
      final result = await insertFavoriteUsecase.execute(event.favoriteItem);
      result.fold((failure) {
        emit(
          state.copyWith(
            message: failure.message,
          ),
        );
      }, (success) {
        emit(state.copyWith(message: success));
      });
      add(StatusFavoriteMeal(event.favoriteItem.idCategory));
    });

    on<RemoveFavoriteMeal>((event, emit) async {
      final result = await deleteFavoriteUsecase.execute(event.favoriteItem);
      result.fold((failure) {
        emit(
          state.copyWith(
            message: failure.message,
          ),
        );
      }, (success) {
        emit(state.copyWith(message: success));
      });
      add(StatusFavoriteMeal(event.favoriteItem.idCategory));
    });

    on<StatusFavoriteMeal>((event, emit) async {
      final status = await getStatusFavoriteUsecase.execute(event.idMeal);

      emit(state.copyWith(isFavorite: status));
    });
  }
}
