import 'package:flutter/material.dart';

class GroceryListScreen extends StatelessWidget {
  final List<String> groceryList;

  GroceryListScreen({Key? key, required this.groceryList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Grocery List"),
        backgroundColor: Color(0xFFD0E1F9),
      ),
      body: groceryList.isEmpty
          ? Center(child: Text("Your grocery list is empty!"))
          : ListView.builder(
              itemCount: groceryList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.check_box_outline_blank),
                  title: Text(groceryList[index]),
                );
              },
            ),
    );
  }
}
