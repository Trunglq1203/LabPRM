import 'package:flutter/material.dart';


class Exercise1Core extends StatelessWidget {
  const Exercise1Core({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exercise 1 – Core Widgets')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text('Welcome to Flutter UI', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            const Icon(Icons.movie_creation_rounded, size: 64, color: Colors.blue),
            const SizedBox(height: 16),
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset('lib/images/anh.jpg', height: 200, fit: BoxFit.cover),
            ),
            const SizedBox(height: 16),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: const ListTile(
                leading: Icon(Icons.star),
                title: Text('Movie Item'),
                subtitle: Text('This is a sample ListTile inside a Card.'),
              ),
            )
          ],
        ),
      ),
    );
  }
}