import 'package:c_enam/Features/Chat/chat_screen.dart';
import 'package:c_enam/Features/Common/home_page.dart';
import 'package:c_enam/Features/Food/food_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CEnamApp extends StatelessWidget {
  const CEnamApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CEnam',
      theme: ThemeData(
        colorScheme: ColorScheme.light(),
        useMaterial3: true,
        textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme),
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
