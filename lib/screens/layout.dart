import 'package:flutter/material.dart';
import 'package:meal_app/provider/my_provider.dart';
import 'package:provider/provider.dart';
import '../widgets/drawer.dart';


class Layout extends StatelessWidget {
  const Layout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Provider.of<MyProvider>(context).pages[Provider.of<MyProvider>(context).selectPageIndex]['title'],),
      ),
      body: Provider.of<MyProvider>(context).pages[Provider.of<MyProvider>(context).selectPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: Provider.of<MyProvider>(context).selectPage,
        currentIndex: Provider.of<MyProvider>(context).selectPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
        ],
      ),
      drawer: const MainDrawer(),
    );
      }

  }



