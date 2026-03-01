import '../models/movie.dart';

const List<Movie> sampleMovies = [
  Movie(
    id: 1,
    title: 'Interstellar',
    posterUrl:
    'https://images.unsplash.com/photo-1524985069026-dd778a71c7b4?auto=format&fit=crop&w=1200&q=80',
    overview:
    'A team of explorers travel through a wormhole in space in an attempt to ensure humanity’s survival.',
    genres: ['Sci-Fi', 'Adventure', 'Drama'],
    rating: 8.6,
    trailers: [
      Trailer(name: 'Official Trailer', url: 'https://example.com/trailer1'),
      Trailer(name: 'Teaser', url: 'https://example.com/trailer2'),
    ],
  ),
  Movie(
    id: 2,
    title: 'The Dark Knight',
    posterUrl:
    'https://images.unsplash.com/photo-1517602302552-471fe67acf66?auto=format&fit=crop&w=1200&q=80',
    overview:
    'Batman faces the Joker, a criminal mastermind who plunges Gotham into chaos.',
    genres: ['Action', 'Crime', 'Drama'],
    rating: 9.0,
    trailers: [
      Trailer(name: 'Trailer 1', url: 'https://example.com/tdk1'),
      Trailer(name: 'Trailer 2', url: 'https://example.com/tdk2'),
    ],
  ),
  Movie(
    id: 3,
    title: 'Spirited Away',
    posterUrl:
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?auto=format&fit=crop&w=1200&q=80',
    overview:
    'During her family’s move to the suburbs, a girl enters a world ruled by spirits and must find her way back.',
    genres: ['Animation', 'Fantasy', 'Family'],
    rating: 8.5,
    trailers: [
      Trailer(name: 'Trailer', url: 'https://example.com/sa1'),
    ],
  ),
];
