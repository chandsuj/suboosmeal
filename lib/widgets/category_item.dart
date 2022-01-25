import 'package:flutter/material.dart';

import '../screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem(this.id, this.title, this.color);

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      CategoryMealsScreen.routeName,
      arguments: {
        'id': id,
        'title': title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import '../screens/category_meals_screen.dart';
// import '../models/meal.dart';
// //import 'package:subooskitchen/category_meals_screen.dart';r

// class CategoryItem extends StatelessWidget {
//   final String id;
//   final String title;
//   final Color color;

//   CategoryItem({@required this.id, @required this.title, @required this.color});
// //method use to change the page
//   void selectCategory(BuildContext ctx) {
//     Navigator.of(ctx).pushNamed(CategoryMealsScreen.routeName,
//         //arguments: );
//         arguments: CategoryMealArguments(id, title));
//     // Navigator.of(ctx).push(
//     //   MaterialPageRoute(
//     //     builder: (_) {
//     //       return CategoryMealsScreen(id, title);
//     //     },
//     //   ),
//     // );
//     //Navigator is the class in the flutter which helps with navigation in the flutter
//   }

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       //on tab we wanna go to different page
//       onTap: () => selectCategory(context),
//       splashColor: Theme.of(context).primaryColor,
//       borderRadius: BorderRadius.circular(15),
//       child: Container(
//         padding: EdgeInsets.all(15),
//         child: Text(
//           title,
//           style: Theme.of(context).textTheme.subtitle1,
//         ),
//         decoration: BoxDecoration(
//             gradient: LinearGradient(
//                 colors: [color.withOpacity(0.7), color],
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight),
//             borderRadius: BorderRadius.circular(15)),
//       ),
//     );
//   }
// }
