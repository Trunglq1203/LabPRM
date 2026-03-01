import 'package:flutter/material.dart';
import 'data/sample_movies.dart';
import 'screens/home_screen.dart';

void main() => runApp(const MovieApp());

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie Detail App',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.indigo),
      home: HomeScreen(movies: sampleMovies),
    );
  }
}
