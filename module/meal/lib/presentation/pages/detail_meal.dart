// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:core/common/utils/state_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal/presentation/bloc/detail_meal/detail_meal_bloc.dart';
import 'package:meal/presentation/pages/detail_content.dart';

class DetailMealPage extends StatefulWidget {
  static const routeName = 'detail';
  static const path = 'detail';
  final String id;
  const DetailMealPage({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<DetailMealPage> createState() => _DetailMealPageState();
}

class _DetailMealPageState extends State<DetailMealPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        context.read<DetailMealBloc>().add(FetchDetailMeal(id: widget.id)));
    Future.microtask(() =>
        context.read<DetailMealBloc>().add(StatusFavoriteMeal(widget.id)));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocConsumer<DetailMealBloc, DetailMealState>(
          listener: (context, state) {
            if (state.isFavorite) {
              final snackbar = SnackBar(
                content: Text(state.message),
                duration: const Duration(seconds: 1),
                backgroundColor: Colors.red,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackbar);
            } else if (!state.isFavorite) {
              final snackbar = SnackBar(
                content: Text(state.message),
                duration: const Duration(seconds: 1),
                backgroundColor: Colors.green,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackbar);
            }
          },
          listenWhen: (previous, current) {
            return previous.message != current.message && current.message != '';
          },
          builder: (context, state) {
            final detailState = state.detailState;
            if (detailState == RequestState.Loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (detailState == RequestState.Loaded) {
              return ListView.builder(
                  itemCount: state.listDetailMealEntity!.meals.length,
                  itemBuilder: (context, index) {
                    final data = state.listDetailMealEntity!.meals[index];
                    return DetailContent(
                        isFavorite: state.isFavorite, data: data);
                  });
            } else if (detailState == RequestState.Error) {
              return Center(
                child: Text(state.message),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
