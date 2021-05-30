import 'package:flutter/material.dart';

import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  //for the listtile of setting and resturant
  Widget buildListTile(String title, IconData icon, Function tabHandler) {
    return ListTile(
        leading: Icon(
          icon,
          size: 26,
        ),
        title: Text(
          title,
          style: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap: () {
          tabHandler();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsetsDirectional.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile('Meals', Icons.restaurant,
           () {
            Navigator.of(context).pushReplacementNamed('/'); //pushed replacemaent page will replace the exiciting page
          }),
          buildListTile('Filters', Icons.settings, 
          () {
            Navigator.of(context).pushReplacementNamed(
              FiltersScreen.routeName,
            );
          }),
        ],
      ),
    );
  }
}
