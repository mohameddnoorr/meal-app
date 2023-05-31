import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/tm_provider.dart';
import '../screens/meals_screen.dart';


class CategoryItem extends StatelessWidget {
  final String id;
  final String title;

  const CategoryItem({
    Key? key,
    required this.id,
    required this.title,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: (){
          Navigator.push(
            context,MaterialPageRoute(
            builder: (context) => const MealsScreen(),
            settings: RouteSettings(
                arguments: {
                  'id':id,
                  'title':title,
                }
            ),
          ),
          );
          },
        splashColor: Colors.blue,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
            // ignore: unrelated_type_equality_checks
            color:Provider.of<ThemeModeProvider>(context).isDark?  Colors.black.withOpacity(0.7):Colors.cyan.withOpacity(0.3),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              title,
              style:  TextStyle(
                color: Provider.of<ThemeModeProvider>(context).isDark? Colors.white60:Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ));
  }
}
