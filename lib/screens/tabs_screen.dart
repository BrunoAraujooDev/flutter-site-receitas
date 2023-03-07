import 'package:flutter/material.dart';
import 'package:projeto_rotas/components/main_drawer.dart';
import 'package:projeto_rotas/models/meal.dart';
import 'package:projeto_rotas/screens/categories_screen.dart';
import 'package:projeto_rotas/screens/favorite_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  const TabsScreen({Key? key, required this.favoriteMeals}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreenIndex = 0;
  late List<Map<String, Object>> _screen;

  @override
  initState() {
    super.initState();

    _screen = [
      {
        "title": "Lista de categorias",
        "screen": CategoriesScreens(),
      },
      {
        "title": "Meus favoritos",
        "screen": FavoriteScreen(
          favoriteMeals: widget.favoriteMeals,
        ),
      }
    ];
  }

  _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          width: double.infinity,
          child: Text(
            _screen[_selectedScreenIndex]["title"].toString(),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      drawer: MainDrawer(),
      body: _screen[_selectedScreenIndex]["screen"] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedScreenIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categorias',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favoritos',
          ),
        ],
      ),
    );

    // DefaultTabController(
    //   length: 2,
    //   child: Scaffold(
    //     appBar: AppBar(
    //       title: Container(
    //         width: double.infinity,
    //         child: const Text(
    //           "Vamos cozinhar?",
    //           textAlign: TextAlign.center,
    //         ),
    //       ),
    //       bottom: const TabBar(
    //         tabs: [
    //           Tab(
    //             icon: Icon(Icons.category),
    //             text: 'Categorias',
    //           ),
    //           Tab(
    //             icon: Icon(Icons.star),
    //             text: 'Favoritos',
    //           ),
    //         ],
    //       ),
    //     ),
    //     body: const TabBarView(
    //       children: [CategoriesScreens(), FavoriteScreen()],
    //     ),
    //   ),
    // );
  }
}
