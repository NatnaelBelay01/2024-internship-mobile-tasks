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
      home: const AddPage(),
    );
  }
}

class AddPage extends StatelessWidget {
  const AddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back_ios_new_rounded,
        ),
        title: Container(
          margin: const EdgeInsets.symmetric(horizontal: 65.0),
          child: const Text("Add Product"),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 366,
              height: 190,
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFFF3F3F3), width: 2),
                borderRadius: BorderRadius.circular(12),
                color: const Color(0xFFF3F3F3),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.insert_photo_outlined,
                        color: Colors.grey[700], size: 40),
                    const Text("Upload Photo")
                  ],
                ),
              ),
            ),
            const Text("name:"),
            const TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                fillColor: Color(0xFFF3F3F3),
                filled: true,
              ),
            ),
            const Text("Catagory:"),
            const TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                fillColor: Color(0xFFF3F3F3),
                filled: true,
              ),
            ),
            const Text("Price:"),
            const TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                fillColor: Color(0xFFF3F3F3),
                filled: true,
              ),
            ),
            const Text("Description: "),
            Container(
              width: 366,
              height: 169,
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFFF3F3F3), width: 2),
                borderRadius: BorderRadius.circular(12),
                color: const Color(0xFFF3F3F3),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(366, 50),
                backgroundColor: const Color(0xFF3F51F3),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    color: Color(0xFF3F51F3),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                foregroundColor: Colors.white,
              ),
              child: const Text("ADD"),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(366, 50),
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    color: Colors.redAccent,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                foregroundColor: Colors.redAccent,
              ),
              child: const Text("Delete"),
            ),
          ],
        ),
      ),
    );
  }
}
