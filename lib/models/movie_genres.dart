class MovieGenres {
  final int id;
  final String name;

  MovieGenres({required this.id, required this.name});

  factory MovieGenres.formJson(Map<String, dynamic> json) {
    return MovieGenres(id: json['id'], name: json['name']);
  }
}
