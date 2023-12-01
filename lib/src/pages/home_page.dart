import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
        body: Padding(
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
                children: List.generate(9, (index) {
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
                          child: Image.network(
                              'https://www.gutenberg.org/cache/epub/72134/pg72134.cover.medium.jpg'),
                        ),
                      ),
                      const Text('Titulo'),
                      const Text('Autor'),
                    ]),
                  );
                }),
              ))
            ],
          ),
        ));
  }
}
