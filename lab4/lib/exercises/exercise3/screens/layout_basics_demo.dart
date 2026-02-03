import 'package:flutter/material.dart';
import '../models/movie_model.dart';
import '../widgets/movie_tile.dart';

class Exercise3Layout extends StatelessWidget {
  const Exercise3Layout({super.key});

  @override
  Widget build(BuildContext context) {
    final movies = [
      Movie(title: 'Avatar'),
      Movie(title: 'Inception'),
      Movie(title: 'Interstellar'),
      Movie(title: 'Joker'),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Exercise 3 – Layout Demo')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Center(child: Text('Now Playing', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: movies.length,
              itemBuilder: (_, i) => MovieTile(movie: movies[i]),
            ),
          )
        ]),
      ),
    );
  }
}