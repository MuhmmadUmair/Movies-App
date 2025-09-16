class GenresList {
  final int id;
  final String name;

  GenresList({required this.id, required this.name});

  factory GenresList.formJson(Map<String, dynamic> json) {
    return GenresList(id: json['id'], name: json['name']);
  }
}
