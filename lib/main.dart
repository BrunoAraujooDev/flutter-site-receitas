import 'package:flutter/material.dart';
import 'package:projeto_rotas/data/dummy_data.dart';
import 'package:projeto_rotas/models/meal.dart';
import 'package:projeto_rotas/models/settings.dart';
import 'package:projeto_rotas/screens/categories_meals.dart';
import 'package:projeto_rotas/screens/categories_screen.dart';
import 'package:projeto_rotas/screens/meal_detail_screen.dart';
import 'package:projeto_rotas/screens/settings_screen.dart';
import 'package:projeto_rotas/screens/tabs_screen.dart';
import 'package:projeto_rotas/utils/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Settings settings = Settings();
  List<Meal> _availableMeals = dummyMeals;
  List<Meal> _favoriteMeals = [];

  void _filterMeals(Settings setting) {
    setState(() {
      settings = setting;
      _availableMeals = dummyMeals.where((meal) {
        final filterGluten = setting.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = setting.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = setting.isVegan && !meal.isVegan;
        final filterVegetarian = setting.isVegetarian && !meal.isVegetarian;

        return !filterGluten &&
            !filterVegetarian &&
            !filterVegan &&
            !filterLactose;
      }).toList();
    });
  }

  void _toggleFavorite(Meal meal) {
    setState(() {
      _favoriteMeals.contains(meal)
          ? _favoriteMeals.remove(meal)
          : _favoriteMeals.add(meal);
    });
  }

  bool _isFavorite(Meal meal){
    return _favoriteMeals.contains(meal);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Vamos Cozinhar?',
        theme: ThemeData(
            primarySwatch: Colors.pink,
            accentColor: Colors.amber,
            fontFamily: 'Raleway',
            canvasColor: const Color.fromRGBO(255, 254, 229, 1),
            textTheme: ThemeData.light().textTheme.copyWith(
                titleLarge:
                    TextStyle(fontSize: 20, fontFamily: 'RobotoCondensed'))),
        home:  TabsScreen(favoriteMeals: _favoriteMeals),
        routes: {
          AppRoutes.HOME: (ctx) => TabsScreen(favoriteMeals: _favoriteMeals,),
          AppRoutes.CATEGORIES_MEALS: (ctx) =>
              CategoriesMeals(meals: _availableMeals),
          AppRoutes.MEAL_DETAIL: (ctx) => MealDetailScreen(_toggleFavorite, _isFavorite),
          AppRoutes.SETTINGS: (ctx) => SettingScreen(
                onSettingsChanged: _filterMeals,
                setting: settings,
              ),
        });
  }
}
