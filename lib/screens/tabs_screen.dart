import 'package:flutter/material.dart';

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
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {
        'page': CategoriesScreen(),
        'title': 'Categories',
      },
      {
        'page': FavoritesScreen(widget.favoriteMeals),
        'title': 'Your Favorite',
      },
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        // type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            title: Text('Categories'),
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



// import 'package:flutter/material.dart';
// import './categories_screen.dart';
// import 'favorites_screen.dart';
// import '../models/meal.dart';

// class TabsScreen extends StatefulWidget {
//   final List<Meal> favoritesMeal;
//   TabsScreen(this.favoritesMeal);
//   @override
//   _TabScreenState createState() => _TabScreenState();
// }

// class _TabScreenState extends State<TabsScreen> {
//   //int _selectedPageIndex = 0;
//   List<Map<String, Object>> _pages;

//   int _selectedPageIndex = 0;
//   @override
//   void initState() {
//     _pages = [
//       {
//         'page': CategoriesScreen(),
//         'title': 'Categories',
//       },
//       {
//         'page': FavoritesScreen(widget.favoritesMeal),
//         'title': 'Your Favroite',
//       }
//     ];
//     super.initState();
//   }

//   void _selectPage(int index) {
//     setState(() {
//       _selectedPageIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return
//         //DefaultTabController(
//         // length: 2,
//         // child:
//         Scaffold(
//       appBar: AppBar(
//         title: Text('Meals'),
//         //   bottom: TabBar(
//         //     tabs: <Widget>[
//         //       Tab(
//         //         icon: Icon(
//         //           Icons.category,
//         //         ),
//         //         text: 'Categories',
//         //       ),
//         //       Tab(
//         //         icon: Icon(
//         //           Icons.star,
//         //         ),
//         //         text: 'Favroites',
//         //       ),
//         //     ],
//         //   ),
//       ),
//       // body: TabBarView(
//       //   children: <Widget>[
//       //     CategoriesScreen(),
//       //     FavoritesScreen(),
//       //   ],
//       // ),
//       body: _pages[_selectedPageIndex]['title'],
//       bottomNavigationBar: BottomNavigationBar(
//         onTap: _selectPage,
//         backgroundColor: Theme.of(context).primaryColor,
//         unselectedItemColor: Colors.white,
//         selectedItemColor: Colors.yellow,
//         currentIndex: _selectedPageIndex,
//         type: BottomNavigationBarType.shifting,
//         //Theme.of(context).white,
//         items: [
//           BottomNavigationBarItem(
//               backgroundColor: Theme.of(context).primaryColor,
//               icon: Icon(Icons.category),
//               title: Text('Categories')),
//           BottomNavigationBarItem(
//               backgroundColor: Theme.of(context).primaryColor,
//               icon: Icon(Icons.star),
//               title: Text('Favorites')),
//         ],
//       ),
//     );
//   }
// }
