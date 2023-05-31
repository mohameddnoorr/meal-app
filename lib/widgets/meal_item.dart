import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/meal_model.dart';
import '../provider/tm_provider.dart';
import '../screens/meal_details_screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  const MealItem({
    Key? key,
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.complexity,
    required this.affordability,
  }) : super(key: key);

  String get complexityText {
    switch (complexity) {
      case Complexity.simple:
        return 'simple';
      case Complexity.challenging:
        return 'challenging';
      case Complexity.hard:
        return 'hard';
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.affordable:
        return 'affordable';

      case Affordability.pricey:
        return 'pricey';

      case Affordability.luxurious:
        return 'luxurious';
    }
  }


  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      splashColor: Colors.cyan,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const MealDetailsScreen(),
            settings: RouteSettings(
              arguments: id,
            ),
          ),
        );
      },
      child: Card(
        color:Provider.of<ThemeModeProvider>(context).isDark? Colors.cyan.withOpacity(0.6):Colors.white,
        elevation: 6,
        margin: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  child: Hero(

                    tag: '_',
                    child: Image(
                      fit: BoxFit.cover,
                      height: 200,
                      width: double.infinity,
                      image: CachedNetworkImageProvider(
                        imageUrl,

                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                  ),
                  child: Text(
                    title,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.schedule_rounded),
                      const SizedBox(width: 5),
                      Text('$duration min')
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.info_rounded),
                      const SizedBox(width: 5),
                      Text(complexityText)
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.attach_money_rounded),
                      const SizedBox(width: 5),
                      Text(affordabilityText)
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
