import 'package:c_enam/Core/Constant/resource_path.dart';
import 'package:c_enam/Features/Chat/View/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../Core/Colors/CEColors.dart';
import '../../Core/TextStyle/CETextStyle.dart';

class FoodScreen extends StatelessWidget {
  static const id = "/food";
  const FoodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Icon(Icons.search),
              SizedBox(
                width: 20,
              ),
              Flexible(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "What shall we deliver?",
                    hintStyle: CETextStyle.hintTextStyle,
                    border: InputBorder.none,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, ChatScreen.id);
                },
                child: Container(
                  margin: EdgeInsets.all(10),
                  height: 40,
                  width: 65,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          ResourcePath.sparkleIcon,
                          colorFilter:
                              ColorFilter.mode(Colors.white, BlendMode.srcIn),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "AI",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
