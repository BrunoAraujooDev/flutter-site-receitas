import 'package:flutter/material.dart';
import 'package:projeto_rotas/components/meal_item.dart';
import 'package:projeto_rotas/data/dummy_data.dart';
import 'package:projeto_rotas/models/category.dart';
import 'package:projeto_rotas/models/meal.dart';

class CategoriesMeals extends StatelessWidget {

  final List<Meal> meals;

  const CategoriesMeals({Key? key, required this.meals}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final category = ModalRoute
        .of(context)
        ?.settings
        .arguments as Category;

    final mealsFromCategory = meals.where((meals) {
      return meals.categories.contains(category.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body:  Center(
          child: ListView.builder(
            itemCount: mealsFromCategory.length,
            itemBuilder: (ctx, index) {
              return MealItem(mealsFromCategory[index]);
            },
          )
      ),
    );
  }
}
