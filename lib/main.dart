import 'package:flutter/material.dart';
import './screens/joke_types_screen.dart';

void main() {
  runApp(RandomJokesApp());
}

class RandomJokesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random Jokes App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: JokeTypesScreen(),
    );
  }
}