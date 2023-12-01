class BooksModel {
  int id;
  String title;
  String author;
  String coverUrl;
  String downloadUrl;

  BooksModel(
      {required this.id,
      required this.title,
      required this.author,
      required this.coverUrl,
      required this.downloadUrl});

  BooksModel.fromJson(Map<String, dynamic> map)
      : id = map['id'],
        title = map['title'],
        author = map['author'],
        coverUrl = map['cover_url'],
        downloadUrl = map['download_url'];
}
