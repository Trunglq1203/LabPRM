import 'package:flutter/material.dart';
import '../models/movie.dart';

class MovieDetailScreen extends StatefulWidget {
  final Movie movie;

  const MovieDetailScreen({super.key, required this.movie});

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final movie = widget.movie;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 260,
            title: Text(movie.title, maxLines: 1, overflow: TextOverflow.ellipsis),
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Hero(
                    tag: 'poster_${movie.id}',
                    child: Image.network(movie.posterUrl, fit: BoxFit.cover),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, Colors.black87],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(movie.title, style: Theme.of(context).textTheme.headlineSmall),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: movie.genres.map((g) => Chip(label: Text(g))).toList(),
                  ),
                  const SizedBox(height: 12),
                  Text(movie.overview),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            tooltip: 'Favorite',
                            onPressed: () => setState(() => isFavorite = !isFavorite),
                            icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
                            color: Colors.black,
                          ),
                          const Text('Favorite', style: TextStyle(fontSize: 12)),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            tooltip: 'Rate',
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Rate tapped (demo)')),
                              );
                            },
                            icon: const Icon(Icons.star_rate),
                          ),
                          const Text('Rate', style: TextStyle(fontSize: 12)),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            tooltip: 'Share',
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Share tapped (demo)')),
                              );
                            },
                            icon: const Icon(Icons.share),
                          ),
                          const Text('Share', style: TextStyle(fontSize: 12)),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  Text('Trailers', style: Theme.of(context).textTheme.titleMedium),
                ],
              ),
            ),
          ),
          SliverList.separated(
            itemCount: movie.trailers.length,
            separatorBuilder: (_, __) => const Divider(height: 1),
            itemBuilder: (context, index) {
              final t = movie.trailers[index];
              return ListTile(
                leading: const Icon(Icons.play_circle_outline),
                title: Text(t.name),
                subtitle: Text(t.url, maxLines: 1, overflow: TextOverflow.ellipsis),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Open trailer: ${t.name} (demo)')),
                  );
                },
              );
            },
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 24)),
        ],
      ),
    );
  }
}
