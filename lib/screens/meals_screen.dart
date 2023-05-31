import 'package:flutter/material.dart';
import 'package:meal_app/models/meal_model.dart';
import 'package:provider/provider.dart';
import '../provider/filters_provider.dart';
import '../widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryId = args['id'];
    final categoryTitle = args['title']!;
    List<Meal> categoryMeals =
        Provider.of<FiltersProvider>(context).availableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: categoryMeals[index].id,
            imageUrl: categoryMeals[index].imageUrl,
            title: categoryMeals[index].title,
            affordability: categoryMeals[index].affordability,
            duration: categoryMeals[index].duration,
            complexity: categoryMeals[index].complexity,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
