import 'package:flutter/material.dart';
import 'package:projeto_rotas/components/category_item.dart';
import 'package:projeto_rotas/data/dummy_data.dart';

class CategoriesScreens extends StatelessWidget {
  const CategoriesScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(20),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 1.5,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: dummyCategories.map((category) {
        return CategoryItem(category);
      }).toList(),
    );
  }
}
