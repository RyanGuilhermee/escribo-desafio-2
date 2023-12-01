import 'package:desafio_escribo_2/src/data/http/http_client.dart';
import 'package:desafio_escribo_2/src/pages/stores/books_store.dart';
import 'package:desafio_escribo_2/src/repositories/books_repository.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final BooksStore store =
      BooksStore(repository: BooksRepository(client: HttpClient()));

  @override
  void initState() {
    super.initState();
    store.getBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(248, 207, 207, 207),
        appBar: AppBar(
            title: const Text(
              'Home',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.deepPurple),
        body: AnimatedBuilder(
          animation:
              Listenable.merge([store.isLoading, store.error, store.state]),
          builder: (context, child) {
            if (store.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            }

            if (store.error.value.isNotEmpty) {
              return Center(
                  child: Text(
                store.error.value,
                style: const TextStyle(color: Colors.red),
              ));
            }

            if (store.state.value.isEmpty) {
              return const Center(
                child: Text('Nenhum livro encontrado'),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                          child: ElevatedButton(
                            onPressed: () {},
                            child: const Text('Livros'),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text('Favoritos'),
                        ),
                      ],
                    ),
                    const Divider(),
                    Expanded(
                        child: GridView.count(
                      crossAxisCount: 2,
                      children:
                          List.generate(store.state.value.length, (index) {
                        final book = store.state.value[index];

                        return Center(
                          child: Column(children: [
                            SizedBox(
                              height: 125,
                              width: 125,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  elevation: 0,
                                ),
                                child: Image.network(book.coverUrl),
                              ),
                            ),
                            Text(book.title,
                                style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    overflow: TextOverflow.ellipsis)),
                            Text(
                              book.author,
                              style: const TextStyle(fontSize: 10),
                            ),
                          ]),
                        );
                      }),
                    ))
                  ],
                ),
              );
            }
          },
        ));
  }
}
