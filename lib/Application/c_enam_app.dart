import 'package:c_enam/Features/Chat/chat_screen.dart';
import 'package:c_enam/Features/Common/home_page.dart';
import 'package:c_enam/Features/Food/food_screen.dart';
import 'package:flutter/material.dart';

class CEnamApp extends StatelessWidget {
  const CEnamApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CEnam',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: HomePage.id,
      routes: {
        HomePage.id: (context) => const HomePage(),
        FoodScreen.id: (context) => const FoodScreen(),
        ChatScreen.id: (context) => ChatScreen(),
      },
    );
  }
}
