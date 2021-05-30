import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';


class FavoriteScreen extends StatelessWidget{
final List<Meal> favoriteMeals;

FavoriteScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty){
      return Center(
      child: Text('favorite'),
      
    );

    }else{
      return ListView.builder(itemBuilder: (ctx, index){
       return MealItem(
         id: favoriteMeals[index].id,
         title: favoriteMeals[index].title,
          affordability: favoriteMeals[index].affordability, 
          complexity: favoriteMeals[index].complexity,
           duration: favoriteMeals[index].duration.toString(), 
           imageUrl: favoriteMeals[index].imageUrl,
           
           );
      },
      itemCount: favoriteMeals.length,
      );
      
   
    }
    
  }
}