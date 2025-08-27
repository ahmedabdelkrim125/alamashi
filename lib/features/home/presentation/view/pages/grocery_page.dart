import 'package:flutter/material.dart';

class GroceryPage extends StatelessWidget {
  const GroceryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "صفحة البقالة",
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}