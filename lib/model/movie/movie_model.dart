class Movie {
  bool adult;
  String backdropPath;
  int id;
  final String? title;
  final String? posterPath;
  String originalLanguage;
  String? originalTitle;
  String overview;
  String mediaType;
  List<int> genreIds;
  double popularity;
  String? releaseDate;
  bool? video;
  double voteAverage;
  int? voteCount;

  Movie({
    required this.adult,
    required this.backdropPath,
    required this.id,
    required this.title,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.mediaType,
    required this.genreIds,
    required this.popularity,
    required this.releaseDate,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      adult: json["adult"],
      backdropPath: json["backdrop_path"],
      id: json["id"],
      title: json['title'] as String?, // Null-safe cast
      posterPath: json['poster_path'] as String?, // Null-safe cast
      originalLanguage: json["original_language"],
      originalTitle: json["original_title"] as String?,
      overview: json["overview"],
      mediaType: json["media_type"],
      genreIds: new List<int>.from(json["genre_ids"].map((x) => x)),
      popularity: json["popularity"].toDouble(),
      releaseDate: json["release_date"] as String?,
      video: json["video"] as bool?,
      voteAverage: json["vote_average"].toDouble(),
      voteCount: json["vote_count"] as int?,
    );
  }
}
