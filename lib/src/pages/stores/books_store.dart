import 'package:desafio_escribo_2/src/models/books_model.dart';
import 'package:desafio_escribo_2/src/repositories/books_repository.dart';
import 'package:flutter/material.dart';

class BooksStore {
  final IBooksRepository repository;

  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  final ValueNotifier<List<BooksModel>> state =
      ValueNotifier<List<BooksModel>>([]);

  final ValueNotifier<String> error = ValueNotifier<String>('');

  BooksStore({required this.repository});

  Future<void> getBooks() async {
    isLoading.value = true;

    try {
      final result = await repository.getBooks();
      state.value = result;
    } on Exception catch (e) {
      error.value = e.toString();
    }

    isLoading.value = false;
  }
}
