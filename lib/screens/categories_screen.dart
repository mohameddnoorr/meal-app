import 'dart:ui';

import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/Sp.jpg',
          fit: BoxFit.cover,
          filterQuality: FilterQuality.high,
          height: double.infinity,
        ),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.2)),
            child: GridView(
              padding: const EdgeInsets.all(20),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 250,
                childAspectRatio: 3 / 2,
                mainAxisSpacing: 30,
                crossAxisSpacing: 30,
              ),
              children: dummyCategories.map((catData) {
                return CategoryItem(
                  id: catData.id,
                  title: catData.title,
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
