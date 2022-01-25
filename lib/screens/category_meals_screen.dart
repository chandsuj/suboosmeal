import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  final List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<Meal> displayedMeals;
  var _loadedInitData = false;

  @override
  void initState() {
    // ...
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];
      displayedMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayedMeals[index].id,
            title: displayedMeals[index].title,
            imageUrl: displayedMeals[index].imageUrl,
            duration: displayedMeals[index].duration,
            affordability: displayedMeals[index].affordability,
            complexity: displayedMeals[index].complexity,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}



// import 'package:flutter/material.dart';
// //import 'package:subooskitchen/models/meal.dart';
// import '../dummy_data.dart';
// import '../widget/meal_item.dart';

// class CategoryMealsScreen extends StatelessWidget {
//   static const routeName = '/category-meals';
//   //want to get the information about which category the user visited in that
//   //or on that page

//   // final String categoryId;
//   // final String categoryTitle;
// // properties added

//   // CategoryMealsScreen() {}
//   // constructor
//   const CategoryMealsScreen({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final routeArgs =
//         ModalRoute.of(context).settings.arguments as CategoryMealArguments;
//     String categoryTitle;
//     String categoryId;
//     if (routeArgs != null) {
//       categoryTitle = routeArgs.categoryTitle;
//       categoryId = routeArgs.categoryId;
//     } else {
//       categoryTitle = "";
//       categoryId = "";
//     }

//     //ModalRoute.of(context).settings.arguments as CategoryMealArguments;
//     //  ModalRoute.of(context).settings.arguments as CategoryMealArguments;
//     //class used to load the  information

//     final categoryMeals = DUMMY_MEALS.where((meal) {
//       return meal.categories.contains(categoryId);
//     }).toList();
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(categoryTitle),
//       ),
//       body: ListView.builder(
//         itemBuilder: (ctx, index) {
//           return MealItem(
//             id: categoryMeals[index].id,
//             title: categoryMeals[index].title,
//             imageUrl: categoryMeals[index].imageUrl,
//             duration: categoryMeals[index].duration,
//             affordability: categoryMeals[index].affordability,
//             complexity: categoryMeals[index].complexity,
//           );
//         },
//         itemCount: categoryMeals.length,
//       ),
//     );
//   }
// }
