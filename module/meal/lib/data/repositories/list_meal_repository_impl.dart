// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:core/common/utils/exceptions.dart';
import 'package:core/common/utils/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:meal/data/datasource/meal_local_data_source.dart';
import 'package:meal/data/datasource/meal_remote_data_source.dart';
import 'package:meal/data/models/favorite_model.dart';
import 'package:meal/domain/entities/detail_meal_entity.dart';
import 'package:meal/domain/entities/favorite_item.dart';
import 'package:meal/domain/entities/list_meals_entity.dart';
import 'package:meal/domain/repositories/list_meal_repository.dart';

class MealRepositoryImpl implements MealRepository {
  final MealRemoteDataSource remoteDataSource;
  final MealLocalDataSource localDataSource;

  MealRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });
  @override
  Future<Either<Failure, ListMealEntity>> getListMeal() async {
    try {
      final result = await remoteDataSource.getListMeal();
      return Right(result.toEntity());
    } on MessageException catch (e) {
      return Left(MessageFailure(e.message));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, List<FavoriteItem>>> getAllFavorite() async {
    try {
      final result = await localDataSource.getAllFavorite();
      return Right(result.map((e) => e.toEntity()).toList());
    } on MessageException catch (e) {
      return Left(MessageFailure(e.message));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, String>> insertToFavorite(
      FavoriteItem favoriteItem) async {
    try {
      final result = await localDataSource
          .insertToFavorite(FavoriteModel.fromEntity(favoriteItem));
      return Right(result);
    } on MessageException catch (e) {
      return Left(MessageFailure(e.message));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, String>> deleteFavorite(FavoriteItem item) async {
    try {
      final result =
          await localDataSource.deleteFavorite(FavoriteModel.fromEntity(item));
      return Right(result);
    } on MessageException catch (e) {
      return Left(MessageFailure(e.message));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, ListDetailMealEntity>> getDetailMeal(String id) async {
    try {
      final result = await remoteDataSource.getDetailMeal(id);
      return Right(result.toEntity());
    } on MessageException catch (e) {
      return Left(MessageFailure(e.message));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<bool> isFavorite(String idMeal) async {
    return await localDataSource.isFavorite(idMeal);
  }
}
