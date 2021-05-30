import 'dart:ui';
import 'package:flutter/material.dart';

import '../models/meal.dart';
import './dummy_data.dart';
import '../screens/filters_screen.dart';
import './screens/tabs_screen.dart';
import './screens/meal_detail_screen.dart';
import 'screens/category_meals_screen.dart';
// import 'screens/categories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _fliters ={
    'gluten'  : false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filterData){
    setState(() {
      _fliters = filterData;

      _availableMeals = DUMMY_MEALS.where((meal){
        if (_fliters['gluten']! && !meal.isGlutenFree){
          return false;
        }
        if (_fliters['lactose']! && !meal.isLactoseFree){
          return false;
        }
        if (_fliters['vegan']! && !meal.isVegan){
          return false;
        }
        if (_fliters['vegetarian']! && !meal.isVegetarian){
          return false;
        }
        return true;

      }).toList();
    });
  }

  void _toggleFavorite(String mealId){
    final existingIndex= _favoriteMeals.indexWhere((meal) => meal.id == mealId);

    if(existingIndex >= 0){
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    }else{
      setState(() {
        DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
      });
    }
  }

  bool _isMealFavorite(String id){
    return _favoriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          body1: TextStyle(color: Color.fromRGBO(20, 52, 52, 1),  
          ),
          body2: TextStyle(color: Color.fromRGBO(20, 52, 52, 1),
        ),
        title: TextStyle(
          fontSize: 20,
          fontFamily: 'RobotoCondesed'
        ),
      ),
      ),
      // home: CategoriesScreen(),  //mark the entry point of the app
      initialRoute: '/',
      routes: {
        '/':(ctx) => TabsScreen(_favoriteMeals),
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName :(ctx) => MealDetailScreen(_toggleFavorite, _isMealFavorite),
        FiltersScreen.routeName :(ctx) => FiltersScreen(_fliters,_setFilters),

      },
    );
  }
}


