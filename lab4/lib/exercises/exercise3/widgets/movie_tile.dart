import 'package:flutter/material.dart';
import '../models/movie_model.dart';

class MovieTile extends StatelessWidget {
  final Movie movie;

  const MovieTile({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        leading: CircleAvatar(child: Text(movie.title[0])),
        title: Text(movie.title),
        subtitle: Text(movie.description),
      ),
    );
  }
}