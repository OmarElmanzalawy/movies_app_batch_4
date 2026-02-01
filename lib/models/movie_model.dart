class MovieModel {
  final int id;
  final String backdropPath;
  final String title;
  final String posterPath;
  final double voteAverage;
  final String releaseDate;
  final List<int> genres;

  MovieModel({
    required this.id,
    required this.backdropPath,
    required this.title,
    required this.posterPath,
    required this.voteAverage,
    required this.releaseDate,
    required this.genres,
  });
}
