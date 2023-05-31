import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/my_provider.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MyProvider>(
      builder: (context, provider, child) {
        if (provider.favoriteMeals.isEmpty) {
          return Center(
            child: Icon(
              Icons.favorite_border_sharp,
              size:400,
              color: Colors.grey.withOpacity(0.2),
            ),
          );
        } else {
          return ListView.builder(
            itemBuilder: (context, index) => MealItem(
              id: provider.favoriteMeals[index].id,
              imageUrl: provider.favoriteMeals[index].imageUrl,
              title: provider.favoriteMeals[index].title,
              affordability: provider.favoriteMeals[index].affordability,
              duration: provider.favoriteMeals[index].duration,
              complexity: provider.favoriteMeals[index].complexity,
            ),
            itemCount: provider.favoriteMeals.length,
          );
        }
      },
    );
  }
}
