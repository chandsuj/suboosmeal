import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(25),
      children: DUMMY_CATEGORIES
          .map(
            (catData) => CategoryItem(
              catData.id,
              catData.title,
              catData.color,
            ),
          )
          .toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
    );
  }
}





// import 'package:flutter/material.dart';
// //import 'package:subooskitchen/widget/category_item.dart';
// //when created widget must import f/m to get access to stateless widget
// import '../dummy_data.dart';
// import '../widgets/category_item.dart';

// class CategoriesScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return
//         //Scaffold(
//         //  appBar: AppBar(
//         //title: const Text('SuboosMeal!'),
//         //),
//         //body:
//         GridView(
//       padding: const EdgeInsets.all(25),
//       children: DUMMY_CATEGORIES
//           .map((catData) => CategoryItem(
//                 id: catData.id,
//                 title: catData.title,
//                 color: catData.color,
//               ))
//           .toList(),
//       gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//         maxCrossAxisExtent: 200,
//         childAspectRatio: 3 / 2,
//         //items sized regarding their height and width relation
//         crossAxisSpacing: 20,
//         mainAxisSpacing: 20,
//         //distance betn columns n  rows in the grid
//       ),
//       // ),
//     );
//   }
// }
