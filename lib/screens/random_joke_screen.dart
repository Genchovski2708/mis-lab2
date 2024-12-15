import 'package:flutter/material.dart';
import '../services/api_services.dart';
import '../widgets/joke_card.dart';

class RandomJokeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Random Joke")),
      body: FutureBuilder<Joke>(
        future: ApiService.fetchRandomJoke(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else {
            final joke = snapshot.data!;
            return Center(
              child: JokeCard(joke: joke),
            );
          }
        },
      ),
    );
  }
}
