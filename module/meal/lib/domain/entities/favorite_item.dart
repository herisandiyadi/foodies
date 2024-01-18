import 'package:equatable/equatable.dart';

class FavoriteItem extends Equatable {
  final int? id;
  final String idCategory;
  final String strCategory;
  final String strCategoryThumb;

  const FavoriteItem({
    this.id,
    required this.idCategory,
    required this.strCategory,
    required this.strCategoryThumb,
  });

  @override
  List<Object?> get props => [
        id,
        idCategory,
        strCategory,
        strCategoryThumb,
      ];
}
