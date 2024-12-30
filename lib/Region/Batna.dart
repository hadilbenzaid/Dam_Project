import 'package:flutter/material.dart';

class Batna extends StatelessWidget {
  const Batna({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Batna'),
        backgroundColor: Colors.orange,
      ),
      body: const Center(
        child: Text(
          'Welcome to Batna!',
          style: TextStyle(fontSize: 24, color: Colors.orange),
        ),
      ),
    );
  }
}
