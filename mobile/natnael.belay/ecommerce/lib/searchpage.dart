
import "package:flutter/material.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SearchPage(),
    );
  }
}

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back_ios_new_rounded,
        ),
        title: Container(
          margin: const EdgeInsets.symmetric(horizontal: 65.0),
          child: const Text("Search Product"),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 270,
                    height: 48,
                    child: const TextField(
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.arrow_forward_rounded),
                        border: OutlineInputBorder(),
                        hintText: 'Leather',
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                height: 300,
                                width: double.infinity,
                                color: Colors.white,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text("Catagory"),
                                    Container(
                                      width: 270,
                                      height: 48,
                                      child: const TextField(
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                    ),
																		const Text("Price"),
                                  ],
                                ),
                              );
                            });
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lightBlueAccent,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                              width: 2,
                              color: Colors.blueAccent,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          )),
                      child: const Icon(
                        Icons.filter_list_rounded,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: _buildCard(20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<Card> _buildCard(int count) {
  List<Card> card = List.generate(
    count,
    (int index) {
      return Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            Image.asset('images/b.jpeg'),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Hello",
                ),
                Text(
                  "World",
                ),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("World"),
                Text(
                  "Hello",
                ),
              ],
            )
          ],
        ),
      );
    },
  );
  return card;
}
