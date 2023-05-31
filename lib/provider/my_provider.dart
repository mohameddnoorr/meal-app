import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import '../models/meal_model.dart';
import '../screens/categories_screen.dart';
import '../screens/favorite_screen.dart';

class MyProvider extends ChangeNotifier {
  int selectPageIndex = 0;
  List<Meal> favoriteMeals=[];
  List<Map> pages = [
    {
      'title': 'Categories',
      'page': const CategoriesScreen(),
    },
    {
      'title': 'favorites',
      'page':   const FavoritesScreen(),
    },
  ];

  void selectPage(int index) {
    selectPageIndex = index;
    notifyListeners();
  }


  Future<bool> toggleFavorite(String mealId,) async {
    final correctIndex = favoriteMeals.indexWhere((meal) =>meal.id == mealId);
    if(correctIndex>=0){
      favoriteMeals.removeAt(correctIndex);
    }else{
      favoriteMeals.add(dummyMeals.firstWhere((meal) =>meal.id == mealId));
    }
    notifyListeners();
    return false;
  }
  bool isFavorite(String id){
    return favoriteMeals.any((meal) =>meal.id == id);
  }



}
