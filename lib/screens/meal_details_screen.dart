import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:provider/provider.dart';
import '../provider/my_provider.dart';
import '../provider/tm_provider.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({Key? key}) : super(key: key);

  Widget buildSectionTitle(String text, Color color) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.bold,
          fontSize: 22,
          fontFamily: 'RobotoCondensed',
        ),
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(20),
        ),
        height: 200,
        width: 400,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final mealSelect = dummyMeals.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            mealSelect.title,
            style: const TextStyle(
              fontFamily: 'RobotoCondensed',
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                elevation: 6,
                child: Hero(

                  tag: '_',
                  child: Image(
                    fit: BoxFit.cover,
                    height: 350,
                    width: double.infinity,
                    image: CachedNetworkImageProvider(
                      mealSelect.imageUrl,
                    ),
                  ),
                ),
              ),
              buildSectionTitle(
                  'Ingredients',
                  Provider.of<ThemeModeProvider>(context).isDark
                      ? Colors.cyan
                      : Colors.black),
              buildContainer(
                ListView.builder(
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.cyan.shade100,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Text(
                          mealSelect.ingredients[index],
                        ),
                      ),
                    );
                  },
                  itemCount: mealSelect.ingredients.length,
                ),
              ),
              buildSectionTitle(
                  "Steps",
                  Provider.of<ThemeModeProvider>(context).isDark
                      ? Colors.cyan
                      : Colors.black),
              buildContainer(
                ListView.separated(
                    itemBuilder: (context, index) => ListTile(
                          leading: Text(
                            '#${index + 1}',
                            style: TextStyle(
                                color: Provider.of<ThemeModeProvider>(context)
                                        .isDark
                                    ? Colors.grey
                                    : Colors.black),
                          ),
                          title: Text(
                            mealSelect.steps[index],
                            style: TextStyle(
                              color:
                                  Provider.of<ThemeModeProvider>(context).isDark
                                      ? Colors.grey
                                      : Colors.black,
                            ),
                          ),
                        ),
                    separatorBuilder: (context, index) => Divider(
                          color: Provider.of<ThemeModeProvider>(context).isDark
                              ? Colors.grey
                              : Colors.black,
                        ),
                    itemCount: mealSelect.steps.length),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.cyan.withOpacity(0.2),
            elevation: 0,
            onPressed: () => Provider.of<MyProvider>(context, listen: false)
                .toggleFavorite(mealId),
            child: Icon(Icons.favorite,
                size: 40,
                color: Provider.of<MyProvider>(
                  context,
                ).isFavorite(mealId)
                    ? Colors.red[600]
                    : Colors.grey)));
  }
}
