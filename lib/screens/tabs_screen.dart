import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';

import '../widgets/main_drawer.dart';
import './favorites_screen.dart';
import './categories_screen.dart';
import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  TabsScreen(this.favoriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
//to select the pages and show the title
//object is equal to dynamic object is showing an error soo
   List<Map<String, dynamic>> ?_pages ;

@override
void initState(){
  _pages = [
    {
      'page': CategoriesScreen(),
      'title': 'Categories',
    },
    {
      'page': FavoriteScreen(widget.favoriteMeals),
      'title': 'Your Favorite',
    },
  ];

  super.initState();

}
  //which data to use
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages![_selectedPageIndex]['title'].toString()),
      ),
      drawer: MainDrawer(),
      body:_pages![_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex, //to show the selected page index
        // type: BottomNavigationBarType.shifting,   //to shift the icons
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            title: Text('Category'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            title: Text('Favorites'),
          ),
        ],
      ),
    );
  }
}
