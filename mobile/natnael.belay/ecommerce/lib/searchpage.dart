import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  MaterialApp build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Container(
          margin: const EdgeInsets.symmetric(horizontal: 65.0),
          child: const Text('Search Product'),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                children: [
                  const SizedBox(
                    width: 270,
                    height: 48,
                    child: TextField(
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.arrow_forward_rounded),
                        border: OutlineInputBorder(),
                        hintText: 'Leather',
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
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
                                    const Text('Catagory', style: TextStyle(fontSize: 20),),
                                    const SizedBox(
                                      width: 290,
                                      height: 48,
                                      child: TextField(
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                    ),
                                    const Text('Price'),
                                    RangeSlider(
                                      values: const RangeValues(20, 80),
                                      min: 0,
                                      max: 100,
                                      divisions: 10,
                                      labels: const RangeLabels('20', '80'),
                                      onChanged: null,
                                    ),
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
                Text('Derby Leather Shoes', style: TextStyle(fontSize: 25)),
                Text(
                  '\$120',
                ),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("men's shoe"),
                Text(
                  '(4.0)',
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
