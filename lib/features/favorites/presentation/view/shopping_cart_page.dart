import 'package:flutter/material.dart';

class ShoppingCartPage extends StatelessWidget {
  const ShoppingCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('عربة التسوق'),
      ),
      body: const Center(
        child: Text('محتوى صفحة عربة التسوق'),
      ),
    );
  }
}
