// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'detail_meal_bloc.dart';

class DetailMealState extends Equatable {
  final ListDetailMealEntity? listDetailMealEntity;
  final RequestState detailState;
  final bool isFavorite;
  final String message;

  const DetailMealState({
    this.listDetailMealEntity,
    required this.detailState,
    required this.isFavorite,
    required this.message,
  });

  @override
  List<Object?> get props => [
        detailState,
        listDetailMealEntity,
        isFavorite,
        message,
      ];

  DetailMealState copyWith({
    ListDetailMealEntity? listDetailMealEntity,
    RequestState? detailState,
    bool? isFavorite,
    String? message,
  }) {
    return DetailMealState(
        listDetailMealEntity: listDetailMealEntity ?? this.listDetailMealEntity,
        detailState: detailState ?? this.detailState,
        isFavorite: isFavorite ?? this.isFavorite,
        message: message ?? this.message);
  }

  factory DetailMealState.initial() {
    return const DetailMealState(
        detailState: RequestState.Empty,
        isFavorite: false,
        listDetailMealEntity: null,
        message: '');
  }
}
