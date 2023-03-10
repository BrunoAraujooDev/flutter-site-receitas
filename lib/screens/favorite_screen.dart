import 'package:flutter/material.dart';
import 'package:projeto_rotas/components/meal_item.dart';
import 'package:projeto_rotas/models/meal.dart';

class FavoriteScreen extends StatelessWidget {

  final List<Meal> favoriteMeals;

  const FavoriteScreen({Key? key, required this.favoriteMeals})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text("Nenhuma refeição foi marcada como favorita!"),
      );
    } else {
      return ListView.builder(itemCount: favoriteMeals.length, itemBuilder: (ctx, index){
        return MealItem(favoriteMeals[index]);
      },);
    }
  }
}
