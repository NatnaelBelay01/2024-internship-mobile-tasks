import 'package:flutter/material.dart';

import 'addpage.dart';
import 'details.dart';
import 'searchpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePage createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
  List<Widget> cardList = [];

  void _addCard(String name, double? price) {
    setState(() {
      cardList.add(
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const MydetailPage(),
              ),
            );
          },
          child: Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                Image.asset('images/b.jpeg'),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(name, style: const TextStyle(fontSize: 24)),
                      Text('\$$price'),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Men's Shoes"),
                      Text('(4.0)'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.account_circle, size: 35.0),
          onPressed: () {},
        ),
        title: const Column(
          children: [
            Text(
              'Aug 6, 2024',
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(height: 2),
            Text(
              'Hello, User',
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_active, size: 35),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Row(
            children: [
              const SizedBox(width: 10),
              const Text('Available Products', style: TextStyle(fontSize: 24)),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.search_rounded),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SearchPage()));
                },
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(children: cardList),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddPage(addCard: _addCard),
            ),
          );
        },
        backgroundColor: Colors.blueAccent,
        child: const Icon(Icons.add),
      ),
    );
  }
}
