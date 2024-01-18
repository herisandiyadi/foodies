import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal/presentation/bloc/page/page_bloc.dart';
import 'package:meal/presentation/pages/favorite.dart';
import 'package:meal/presentation/pages/home.dart';

class HomePage extends StatefulWidget {
  static const routeName = 'homepage';
  static const path = '/homepage';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<BottomNavigationBarItem> listItem = [
    const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.favorite), label: 'Favorite'),
  ];

  List listPage = [const Home(), const Favorite()];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<PageBloc, int>(
        builder: (context, state) {
          return Scaffold(
            body: listPage[state],
            bottomNavigationBar: BottomNavigationBar(
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite), label: 'Favorite'),
              ],
              currentIndex: state,
              selectedItemColor: Colors.red,
              unselectedItemColor: Colors.grey,
              onTap: (value) {
                context.read<PageBloc>().add(SelectPage(selected: value));
              },
            ),
          );
        },
      ),
    );
  }
}
