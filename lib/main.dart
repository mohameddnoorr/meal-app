import 'package:flutter/material.dart';
import 'package:meal_app/provider/filters_provider.dart';
import 'package:meal_app/provider/my_provider.dart';
import 'package:meal_app/provider/tm_provider.dart';
import 'package:meal_app/screens/layout.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MyProvider()),
        ChangeNotifierProvider(create: (context) => FiltersProvider()),
        ChangeNotifierProvider<ThemeModeProvider>(
          create:(context) =>ThemeModeProvider(),
        )
      ],

      child: Consumer<ThemeModeProvider>(

        builder: (BuildContext context, value, Widget? child) {
          return  MaterialApp(

            themeMode: value.tm,
            theme: ThemeData(
              primarySwatch: Colors.cyan,
            ),
            darkTheme: ThemeData(
              primarySwatch:Colors.cyan,
              scaffoldBackgroundColor: Colors.black,
              appBarTheme: const AppBarTheme(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.cyan

              ),
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                backgroundColor: Colors.black,
                unselectedItemColor: Colors.grey,
              ),
            ),
            debugShowCheckedModeBanner: false,
            home: const Layout(),
          );
        },
      ),
    );
  }
}
