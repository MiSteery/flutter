import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  //route name
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget.currentFilters['gluten']!;
    _lactoseFree = widget.currentFilters['lactose']!;
    _vegetarian = widget.currentFilters['vegetarian']!;
    _vegan = widget.currentFilters['vegan']!;
    super.initState();
  }

  //doesnot work so ..

  // Widget _buildSwitchListTile(
  //   String title,
  //   String description,
  //   bool currentValue,
  //   Function updateValue,
  // ) {
  //   return SwitchListTile(
  //     value: currentValue,
  //     title: Text(title),
  //     subtitle: Text(description),
  //     onChanged: (_) => updateValue,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Favorite'),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                final selectedFilters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian,
                };
                widget.saveFilters(selectedFilters);
              },
              icon: Icon(Icons.save))
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Asjust your meal selection',
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                SwitchListTile(
                    title: Text('_glutenFree'),
                    value: _glutenFree,
                    subtitle: Text('Only include glutenFree meals'),
                    onChanged: (newValue) {
                      setState(() {
                        _glutenFree = newValue;
                      });
                    }),

                    SwitchListTile(
                    title: Text('_lactoseFree'),
                    value: _lactoseFree,
                    subtitle: Text('Only include _lactoseFree meals'),
                    onChanged: (newValue) {
                      setState(() {
                        _lactoseFree = newValue;
                      });
                    }),

                    SwitchListTile(
                    title: Text('_vegetarian'),
                    value: _vegetarian,
                    subtitle: Text('Only include vegetarian meals'),
                    onChanged: (newValue) {
                      setState(() {
                        _vegetarian = newValue;
                      });
                    }),

                    SwitchListTile(
                    title: Text('_vegan'),
                    value: _vegan,
                    subtitle: Text('Only include _vegan meals'),
                    onChanged: (newValue) {
                      setState(() {
                        _vegan = newValue;
                      });
                    }),

                //an alternative method of listviwe by defining on _buildSwitchListTile

                // _buildSwitchListTile(
                //     '_glutenFree', 'Only include glutenFree meals', _glutenFree,
                //     (newValue) {
                //   setState(
                //     () {
                //       _glutenFree = newValue;
                //     },
                //   );
                // }),
                // _buildSwitchListTile('_lactoseFree',
                //     'Only include glutenFree meals', _lactoseFree, (newValue) {
                //   setState(
                //     () {
                //       _glutenFree = newValue;
                //     },
                //   );
                // }),
                // _buildSwitchListTile(
                //     '_vegetarian', 'Only include vegetarian meals', _vegetarian,
                //     (newValue) {
                //   setState(
                //     () {
                //       _vegetarian = newValue;
                //     },
                //   );
                // }),
                // _buildSwitchListTile(
                //     '_vegan', 'Only include vegan meals', _vegan, (newValue) {
                //   setState(
                //     () {
                //       _vegan = newValue;
                //     },
                //   );
                // }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
