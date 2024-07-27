import 'package:c_enam/Core/Colors/CEColors.dart';
import 'package:c_enam/Core/TextStyle/CETextStyle.dart';
import 'package:c_enam/Features/Food/food_screen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const id = "/";
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "CEnam",
          style: CETextStyle.titleStyle,
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: const LinearGradient(
              colors: [CEcolors.startGreenGradient, CEcolors.endGreenGradient],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Center(
        child: AspectRatio(
          aspectRatio: 1.0,
          child: GridView.count(
            crossAxisCount: 3,
            children: List.generate(3, (index) {
              return TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, FoodScreen.id);
                },
                child: Text("Profile ${index}"),
              );
            }),
          ),
        ),
      ),
    );
  }
}
