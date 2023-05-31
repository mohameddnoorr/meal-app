import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:meal_app/widgets/build_filters.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(100),
        ),
        child: Drawer(
          child: Column(
            children: [
              Container(
                alignment: AlignmentDirectional.center,
                width: double.infinity,
                height: 100,
                decoration: const BoxDecoration(color: Colors.cyan),
                child: const Text(
                  'Meal App',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              Expanded(
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/images/bu.jpg',
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.high,
                      height: double.infinity,
                    ),
                    Center(
                      child: ClipRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.4)),
                            child: const Filters(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


