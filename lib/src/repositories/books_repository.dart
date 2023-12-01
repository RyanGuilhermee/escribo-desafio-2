import 'dart:convert';
import 'package:desafio_escribo_2/src/data/http/http_client.dart';
import 'package:desafio_escribo_2/src/models/books_model.dart';

abstract class IBooksRepository {
  Future<List<BooksModel>> getBooks();
}

class BooksRepository implements IBooksRepository {
  final IHttpClient client;

  BooksRepository({required this.client});

  @override
  Future<List<BooksModel>> getBooks() async {
    final response = await client.get(url: 'https://escribo.com/books.json');

    if (response.statusCode == 200) {
      final List<BooksModel> books = [];

      final body = jsonDecode(response.body) as List;

      body.map((item) {
        final BooksModel book = BooksModel.fromJson(item);
        books.add(book);
      }).toList();

      return books;
    }

    throw Exception('Não foi possível carregar os livros');
  }
}
