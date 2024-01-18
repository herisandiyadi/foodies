// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:meal/data/datasource/local/database.dart';
import 'package:meal/domain/entities/favorite_item.dart';

class FavoriteModel {
  final int? id;
  final String idCategory;
  final String strCategory;
  final String strCategoryThumb;

  FavoriteModel({
    this.id,
    required this.idCategory,
    required this.strCategory,
    required this.strCategoryThumb,
  });

  factory FavoriteModel.fromJson(Map<String, dynamic> json) => FavoriteModel(
        id: json["id"],
        idCategory: json["idCategory"],
        strCategory: json["strCategory"],
        strCategoryThumb: json["strCategoryThumb"],
      );

  factory FavoriteModel.fromEntity(FavoriteItem item) => FavoriteModel(
        id: item.id,
        idCategory: item.idCategory,
        strCategory: item.strCategory,
        strCategoryThumb: item.strCategoryThumb,
      );

  factory FavoriteModel.fromDatabase(MealData item) => FavoriteModel(
        // id: item.id,
        idCategory: item.idMeal,
        strCategory: item.title,
        strCategoryThumb: item.imageUrl,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "idCategory": idCategory,
        "strCategory": strCategory,
        "strCategoryThumb": strCategoryThumb,
      };

  MealData toDatabase() {
    return MealData(
      // id: id ?? id!,
      idMeal: idCategory,
      title: strCategory,
      imageUrl: strCategoryThumb,
    );
  }

  FavoriteItem toEntity() {
    return FavoriteItem(
      id: id ?? id,
      idCategory: idCategory,
      strCategory: strCategory,
      strCategoryThumb: strCategoryThumb,
    );
  }
}
