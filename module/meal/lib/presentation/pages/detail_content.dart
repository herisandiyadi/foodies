// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal/domain/entities/detail_meal_entity.dart';
import 'package:meal/domain/entities/favorite_item.dart';
import 'package:meal/presentation/bloc/detail_meal/detail_meal_bloc.dart';

import 'package:go_router/go_router.dart';

class DetailContent extends StatelessWidget {
  final bool isFavorite;
  final DetailMealEntity data;
  const DetailContent({
    Key? key,
    required this.isFavorite,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            CachedNetworkImage(imageUrl: data.strMealThumb),
            Positioned(
              top: 5,
              right: 5,
              child: isFavorite
                  ? IconButton(
                      onPressed: () {
                        final favoriteItem = FavoriteItem(
                          idCategory: data.idMeal,
                          strCategory: data.strMeal,
                          strCategoryThumb: data.strMealThumb,
                        );
                        context
                            .read<DetailMealBloc>()
                            .add(RemoveFavoriteMeal(favoriteItem));
                      },
                      icon: const Icon(
                        Icons.favorite,
                        color: Colors.red,
                        size: 30,
                      ))
                  : IconButton(
                      onPressed: () {
                        final favoriteItem = FavoriteItem(
                          idCategory: data.idMeal,
                          strCategory: data.strMeal,
                          strCategoryThumb: data.strMealThumb,
                        );

                        context
                            .read<DetailMealBloc>()
                            .add(InsertFavoriteMeal(favoriteItem));
                      },
                      icon: const Icon(
                        Icons.favorite_outline_outlined,
                        color: Colors.red,
                        size: 30,
                      )),
            ),
            Positioned(
              top: 10,
              left: 10,
              child: GestureDetector(
                onTap: () {
                  context.pop();
                },
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white54, shape: BoxShape.circle),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                        size: 30,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Center(
          child: Text(
            data.strMeal,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            'Instructions',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            data.strInstructions,
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}
