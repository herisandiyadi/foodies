import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meal/presentation/pages/detail_meal.dart';
import 'package:meal/presentation/pages/home_page.dart';

class AppRouter {
  static GoRouter routeNavigation() {
    GoRouter router = GoRouter(
        navigatorKey: GlobalKey<NavigatorState>(),
        routerNeglect: false,
        initialLocation: '/homepage',
        observers: [routeObserver],
        errorPageBuilder: (context, state) {
          return const MaterialPage(
            child: Scaffold(
              body: Center(
                child: Text('Page Error'),
              ),
            ),
          );
        },
        debugLogDiagnostics: true,
        redirect: (context, state) {
          print(state.fullPath);
        },
        routes: [
          GoRoute(
              path: HomePage.path,
              name: HomePage.routeName,
              builder: (context, state) {
                return const HomePage();
              },
              routes: [
                GoRoute(
                  path: DetailMealPage.path,
                  name: DetailMealPage.routeName,
                  builder: (context, state) {
                    final extras = state.extra as String;
                    return DetailMealPage(
                      id: extras,
                    );
                  },
                )
              ]),
        ]);

    return router;
  }
}

final RouteObserver<ModalRoute> routeObserver = RouteObserver<ModalRoute>();
