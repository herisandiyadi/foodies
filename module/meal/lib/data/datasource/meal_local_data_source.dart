import 'package:drift/drift.dart';
import 'package:meal/data/datasource/local/database.dart';
import 'package:meal/data/models/favorite_model.dart';

abstract class MealLocalDataSource {
  Future<String> insertToFavorite(FavoriteModel favoriteModel);
  Future<List<FavoriteModel>> getAllFavorite();
  Future<String> deleteFavorite(FavoriteModel model);
  Future<bool> isFavorite(String idMeal);
}

class MealLocalDataSourceImpl implements MealLocalDataSource {
  final database = MyDatabase();
  @override
  Future<String> insertToFavorite(FavoriteModel favoriteModel) async {
    await database.into(database.meal).insert(
          MealCompanion.insert(
            idMeal: favoriteModel.idCategory,
            title: favoriteModel.strCategory,
            imageUrl: favoriteModel.strCategoryThumb,
          ),
        );
    return 'Ditambahkan ke favorit';
  }

  @override
  Future<List<FavoriteModel>> getAllFavorite() async {
    final data = await database.select(database.meal).get();
    return data.map((e) => FavoriteModel.fromDatabase(e)).toList();
  }

  @override
  Future<String> deleteFavorite(FavoriteModel model) async {
    await (database.meal
        .deleteWhere((tbl) => tbl.idMeal.equals(model.idCategory)));
    return 'Dihapus dari favorit';
  }

  @override
  Future<bool> isFavorite(String idMeal) async {
    final data = await (database.meal.select()
          ..where((tbl) => tbl.idMeal.equals(idMeal)))
        .getSingleOrNull();
    if (data != null && data.idMeal == idMeal) {
      return true;
    } else {
      return false;
    }
  }
}
