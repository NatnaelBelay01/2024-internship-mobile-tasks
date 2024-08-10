import 'package:flutter/material.dart';

class AddPage extends StatelessWidget {
  final Function(String, double?) addCard;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _desController = TextEditingController();

  AddPage({required this.addCard, super.key});

  void _submit(BuildContext context) {
    final String name = _nameController.text;
    final double? price = double.tryParse(_priceController.text);
		final String description = _desController.text;
    if (name.isNotEmpty && price != null && description.isNotEmpty) {
      addCard(name, price);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        title: const Center(child: Text('Add Product')),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
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
                    const Text('Upload Photo')
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text('Name:'),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                border: InputBorder.none,
                fillColor: Color(0xFFF3F3F3),
                filled: true,
              ),
            ),
            const SizedBox(height: 16),
            const Text('Price:'),
            TextField(
              controller: _priceController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: InputBorder.none,
                fillColor: Color(0xFFF3F3F3),
                filled: true,
              ),
            ),
            const Text('Description:'),
            TextField(
              controller: _desController,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 80),
                border: InputBorder.none,
                fillColor: Color(0xFFF3F3F3),
                filled: true,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _submit(context),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
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
              child: const Text('ADD'),
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
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
              child: const Text('Delete'),
            ),
          ],
        ),
      ),
    );
  }
}
