import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  final Map<String, Widget> cardmap;
  const SearchPage({required this.cardmap, super.key});
  @override
  _SearchPage createState() => _SearchPage();
  Map<String, Widget> getcard() {
    return cardmap;
  }
}

class _SearchPage extends State<SearchPage> {
  final TextEditingController searchcontroller = TextEditingController();
  List<Widget> searchresult = [];
  Map<String, Widget> allResults = {};
  @override
  void initState() {
    super.initState();
    searchresult = widget.getcard().values.toList();
    allResults = widget.getcard();
  }

  void searchResults(String name) {
    if (allResults.containsKey(name)) {
      setState(() {
        searchresult = [];
        searchresult.add(allResults[name] ?? const Card());
      });
    }
  }

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
                  SizedBox(
                    width: 270,
                    height: 48,
                    child: TextField(
                      controller: searchcontroller,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () =>
                                searchResults(searchcontroller.text),
                            icon: const Icon(Icons.arrow_forward_rounded)),
                        border: const OutlineInputBorder(),
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
                              return Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Container(
                                    height: 350,
                                    width: double.infinity,
                                    color: Colors.white,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Catagory',
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        const SizedBox(
                                          width: double.infinity,
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
																					inactiveColor: Colors.grey,
																					activeColor: Colors.blue,
                                          labels: const RangeLabels('20', '80'),
                                          onChanged: (RangeValues newValues){},
                                        ),
                                        SizedBox(
                                          width: double.infinity,
                                          height: 40,
                                          child: ElevatedButton(
                                            onPressed: () {},
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.blue,
                                              foregroundColor: Colors.white,
                                            ),
                                            child: const Text('Apply'),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ));
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
                children: searchresult,
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
