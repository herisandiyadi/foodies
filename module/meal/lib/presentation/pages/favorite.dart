import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal/domain/entities/favorite_item.dart';
import 'package:meal/presentation/bloc/detail_meal/detail_meal_bloc.dart';
import 'package:meal/presentation/bloc/meal/meal_bloc.dart';
import 'package:meal/presentation/pages/detail_meal.dart';
import 'package:go_router/go_router.dart';

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
        () => context.read<MealBloc>().add(const FetchAllFavorite()));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MealBloc, MealState>(
      builder: (context, state) {
        if (state is MealLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is MealFailed) {}
        if (state is GetFavoriteSuccess) {
          if (state.favoriteItem.isEmpty) {
            return const Center(
              child: Text('Tidak ada Favorite'),
            );
          } else {
            return ListView.builder(
                itemCount: state.favoriteItem.length,
                itemBuilder: (context, index) {
                  final data = state.favoriteItem[index];
                  return GestureDetector(
                    onTap: () => context.goNamed(
                      DetailMealPage.routeName,
                      extra: data.idCategory,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 8),
                      child: Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.grey)),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20)),
                                  child: CachedNetworkImage(
                                    imageUrl: data.strCategoryThumb,
                                    height: 130,
                                    width: MediaQuery.of(context).size.width,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                  top: 5,
                                  right: 5,
                                  child: IconButton(
                                      onPressed: () {
                                        final favoriteItem = FavoriteItem(
                                          idCategory: data.idCategory,
                                          strCategory: data.strCategory,
                                          strCategoryThumb:
                                              data.strCategoryThumb,
                                        );
                                        context.read<DetailMealBloc>().add(
                                            RemoveFavoriteMeal(favoriteItem));
                                        if (mounted) {
                                          Future.microtask(() => context
                                              .read<MealBloc>()
                                              .add(const FetchAllFavorite()));
                                        }
                                      },
                                      icon: const Icon(
                                        Icons.favorite,
                                        color: Colors.red,
                                        size: 30,
                                      )),
                                )
                              ],
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data.strCategory,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                });
          }
        }
        return const Center(child: SizedBox());
      },
    );
  }
}
