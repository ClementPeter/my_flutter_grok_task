import 'package:flutter/material.dart';

//Grok Task One : Build a ListView containing Mock Data with Refresh Indicator
class ItemListScreen extends StatefulWidget {
  const ItemListScreen({super.key});

  @override
  _ItemListScreenState createState() => _ItemListScreenState();
}

class _ItemListScreenState extends State<ItemListScreen> {
  List<Map<String, dynamic>> mockData = [
    {'id': 1, 'name': 'Item 1'},
    {'id': 2, 'name': 'Item 2'},
    // Add 8 more items
    {'id': 3, 'name': 'Third Item'},
    {'id': 4, 'name': 'Fourth Item'},
    {'id': 5, 'name': 'Fifth Item'},
    {'id': 6, 'name': 'Sixth Item'},
    {'id': 7, 'name': 'Seventh Item'},
    {'id': 8, 'name': 'Eight Item'},
  ];

  Future<void> _refreshData() async {
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      // Update mockData (e.g., shuffle or add new item)
      mockData.shuffle();
    });
    if (context.mounted == true) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text('Data refreshed!'), duration: Duration(seconds: 2)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pull to Refresh Data')),
      body: RefreshIndicator(
        displacement: 50,
        onRefresh: _refreshData,
        child: Expanded(
          child: ListView.builder(
            itemCount: mockData.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: Text(mockData[index]['id'].toString()),
                  title: Text(mockData[index]['name']),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: Colors.grey.shade300),
                  ),
                  tileColor: const Color(0xFFBCBCBC),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
