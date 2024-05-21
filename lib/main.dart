import 'package:flutter/material.dart';
import 'package:social_media_app/cores.dart';
import 'package:social_media_app/data/post_inherited.dart';
import 'package:social_media_app/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),

        useMaterial3: true,

        scaffoldBackgroundColor: CoresTema().darkPurple,

        floatingActionButtonTheme: FloatingActionButtonThemeData(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          backgroundColor: CoresTema().lightPurple,
        ),

        bottomAppBarTheme: BottomAppBarTheme(
          color: CoresTema().midPurple,
        ),
      ),
      home: PostInherited(
        child: const HomeScreen(),
      ),
    );
  }
}
