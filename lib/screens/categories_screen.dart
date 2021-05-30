import 'package:flutter/material.dart';
import 'package:meal_app/widgets/category_item.dart';

import '../dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lockdown Meal')),
      body: GridView(
        padding: const EdgeInsets.all(25),
        children: DUMMY_CATEGORIES
            .map(
              (catData) => CategoryItem(
                catData.id,
                catData.color, 
                catData.title,
                ),
            )
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200, //maximum extend of the tiles
          childAspectRatio: 3 / 2, //define how the child should be sized
          crossAxisSpacing: 20,
          mainAxisSpacing: 20, //define the spacing between the row and column
        ),
      ),
    );
  }
}
