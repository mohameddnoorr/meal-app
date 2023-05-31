
import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../models/meal_model.dart';

class FiltersProvider extends ChangeNotifier {



  Map<String, bool> filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> availableMeals = dummyMeals;
  void setFilters(Map<String, bool> filterData) {
    filters = filterData;
    availableMeals = dummyMeals.where((meal) {
      if (filters['gluten'] == true && meal.isGlutenFree == false) {
        return false;
      }
      if (filters['lactose'] == true && meal.isLactoseFree == false) {
        return false;
      }
      if (filters['vegan'] == true && meal.isVegan == false) {
        return false;
      }
      if (filters['vegetarian'] == true && meal.isVegetarian == false) {
        return false;
      }
      return true;
    }).toList();
    notifyListeners();
  }


  bool isGlutenFree = false;
  void switchGlutenFree(bool switchState) {
    isGlutenFree = switchState;
    final Map<String,bool> selectGlutenFree={
      'gluten':isGlutenFree,
      'vegan':isVegan,
      'vegetarian':isVegetarian,
      'lactose':isLactoseFree,
    };
    setFilters(selectGlutenFree);
    notifyListeners();
  }


  bool isLactoseFree = false;
  void switchLactoseFree(bool switchState) {
    isLactoseFree = switchState;
    final Map<String,bool> selectLactoseFree={
      'lactose':isLactoseFree,
      'vegan':isVegan,
      'vegetarian':isVegetarian,
      'gluten':isGlutenFree,
    };
    setFilters(selectLactoseFree);
    notifyListeners();
  }


  bool isVegan = false;
  void switchVegan(bool switchState) {
    isVegan = switchState;
    final Map<String,bool> selectVegan={
      'vegan':isVegan,
      'vegetarian':isVegetarian,
      'lactose':isLactoseFree,
      'gluten':isGlutenFree
    };
    setFilters(selectVegan);
    notifyListeners();
  }


  bool isVegetarian = false;
  void switchVegetarian(bool switchState) {
    isVegetarian = switchState;
    final Map<String,bool> selectVegetarian={
      'vegetarian':isVegetarian,
      'vegan':isVegan,
      'lactose':isLactoseFree,
      'gluten':isGlutenFree

    };
    setFilters(selectVegetarian);
    notifyListeners();
  }




}