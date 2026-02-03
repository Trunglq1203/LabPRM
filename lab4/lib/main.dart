import 'package:flutter/material.dart';
import 'home_screen.dart';


void main() {
  runApp(const MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});


  @override
  State<MyApp> createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.light;


  void toggleTheme(bool value) {
    setState(() {
      _themeMode = value ? ThemeMode.dark : ThemeMode.light;
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF7F5FA),
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: _themeMode,
      home: HomeScreen(onThemeChanged: toggleTheme),
    );
  }
}