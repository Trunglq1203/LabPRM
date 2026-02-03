import 'package:flutter/material.dart';


class FixListViewExpanded extends StatelessWidget {
  const FixListViewExpanded({super.key});


  @override
  Widget build(BuildContext context) {
    final movies = ['Movie A', 'Movie B', 'Movie C', 'Movie D'];


    return Scaffold(
      appBar: AppBar(title: const Text('Fix ListView using Expanded')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Correct ListView inside Column using Expanded',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: movies.length,
                itemBuilder: (_, i) => ListTile(
                  leading: const Icon(Icons.movie),
                  title: Text(movies[i]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}