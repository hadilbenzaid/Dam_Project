import 'package:flutter/material.dart';

class Constantine extends StatelessWidget {
  const Constantine({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Constantine'),
        backgroundColor: Colors.orange,
      ),
      body: const Center(
        child: Text(
          'Welcome to Constantine!',
          style: TextStyle(fontSize: 24, color: Colors.orange),
        ),
      ),
    );
  }
}
