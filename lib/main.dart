import 'package:core/common/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodies_app/injection.dart' as di;
import 'package:meal/presentation/bloc/detail_meal/detail_meal_bloc.dart';
import 'package:meal/presentation/bloc/meal/meal_bloc.dart';
import 'package:meal/presentation/bloc/page/page_bloc.dart';

void main() {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final route = AppRouter.routeNavigation();

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => di.locator<MealBloc>()),
        BlocProvider(create: (context) => di.locator<PageBloc>()),
        BlocProvider(create: (context) => di.locator<DetailMealBloc>()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Foodies',
        routerDelegate: route.routerDelegate,
        routeInformationProvider: route.routeInformationProvider,
        routeInformationParser: route.routeInformationParser,
        theme: ThemeData(
          primarySwatch: Colors.red,
          useMaterial3: true,
        ),
      ),
    );
  }
}
