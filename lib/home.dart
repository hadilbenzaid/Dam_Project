// ignore_for_file: prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My application'),
          actions: [],
        ),
        body: ListView(
          children: [
            // Text("How Are You", style: )
          ],
        ));
  }
}