import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/category_meals_screen.dart';
import 'package:meal_app/screens/meal_detail_screen.dart';
import 'package:meal_app/screens/tabs_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DeliMeals',
      theme: ThemeData(
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',

        // textTheme: ThemeData.light().textTheme.copyWith(
        //       bodyText1: const TextStyle(
        //         color: Color.fromRGBO(20, 51, 51, 1),
        //       ),
        //       bodyText2: const TextStyle(
        //         color: Color.fromRGBO(20, 51, 51, 1),
        //       ),
        //       titleLarge: const TextStyle(
        //         fontSize: 24,
        //         fontFamily: 'RobotoCondensed',
        //       ),
        //     ),
        // colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink)
        //     .copyWith(secondary: Colors.amber),
      ),
      initialRoute: TabsScreen.routeName,
      routes: {
        CategoriesScreen.routeName: (context) => const CategoriesScreen(),
        CategoryMealsScreen.routeName: (context) => const CategoryMealsScreen(),
        MealDetailScreen.routeName: (context) => const MealDetailScreen(),
        TabsScreen.routeName: (context) => const TabsScreen(),
      },
      onGenerateRoute: (settings) {
        if (kDebugMode) {
          print(settings.arguments);
        }
        return MaterialPageRoute(
          builder: (context) => const TabsScreen(),
        );
      },
      onUnknownRoute: (settings) {
        if (kDebugMode) {
          print(settings.arguments);
        }
        return MaterialPageRoute(
          builder: (context) => const TabsScreen(),
        );
      },
    );
  }
}