import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/filters_provider.dart';
import '../provider/tm_provider.dart';


Widget buildSwitch({
  required String title,
  required bool value,
  required Function(bool) updateSwitch,
}) {
  return Positioned(
    child: SwitchListTile(
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      value: value,
      onChanged: updateSwitch,
    ),
  );
}

class Filters extends StatelessWidget {
   const Filters({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ListView(
      padding: const EdgeInsets.all(8),
      children: [
        buildSwitch(
            title: 'Gluten-Free',
            value: Provider.of<FiltersProvider>(context).isGlutenFree,
            updateSwitch: Provider.of<FiltersProvider>(context).switchGlutenFree
        ),
        buildSwitch(
            title: 'Lactose-Free',
            value: Provider.of<FiltersProvider>(context).isLactoseFree,
            updateSwitch: Provider.of<FiltersProvider>(context).switchLactoseFree),
        buildSwitch(
            title: 'Vegan',
            value: Provider.of<FiltersProvider>(context).isVegan,
            updateSwitch:Provider.of<FiltersProvider>(context).switchVegan),
        buildSwitch(
            title: 'Vegetarian',
            value: Provider.of<FiltersProvider>(context).isVegetarian,
            updateSwitch: Provider.of<FiltersProvider>(context).switchVegetarian),
        buildSwitch(
            title: 'Dark-Mode',
            value: Provider.of<ThemeModeProvider>(context).isDark,
            updateSwitch: Provider.of<ThemeModeProvider>(context,listen: false).switchThemeMode)
      ],
    );
  }


}




