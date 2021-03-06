

import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
//import '../dummy_data.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {

  static const routeName = '/category-meals';

  final List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
   String ?categoryTitle;
   List<Meal> ?displayedMeals;
   var _loadedInitData =false;


@override
  void didChangeDependencies() {
    if(!_loadedInitData){
      final routeArgs = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
     categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
      displayedMeals= widget.availableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    _loadedInitData =true;
    }
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
//funtion to remove the item
  void _removeMeal (String mealId){
    setState(() {
      displayedMeals!.removeWhere((meal) => meal.id == mealId);
    });

  }

  @override
  Widget build(BuildContext context) {
    // final routeArgs = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    // final categoryTitle = routeArgs['title'];
    // final categoryId = routeArgs['id'];
    // final categoryMeals = DUMMY_MEALS.where((meal) {
    //   return meal.categories.contains(categoryId);
    // }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(itemBuilder: (ctx, index){
       return MealItem(
         id: displayedMeals![index].id,
         title: displayedMeals![index].title,
          affordability: displayedMeals![index].affordability, 
          complexity: displayedMeals![index].complexity,
           duration: displayedMeals![index].duration.toString(), 
           imageUrl: displayedMeals![index].imageUrl,
         //  removeItem: _removeMeal,
           );
      },
      itemCount: displayedMeals!.length,
      ),

    );
  }
}