import 'package:flutter/material.dart';
import '../services/api_services.dart';

class JokeCard extends StatefulWidget {
  final Joke joke;

  JokeCard({required this.joke});

  @override
  _JokeCardState createState() => _JokeCardState();
}

class _JokeCardState extends State<JokeCard> {
  bool _isPunchlineVisible = false;

  void _togglePunchlineVisibility() {
    setState(() {
      _isPunchlineVisible = !_isPunchlineVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.joke.setup, style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            GestureDetector(
              onTap: _togglePunchlineVisibility,
              child: Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  _isPunchlineVisible ? widget.joke.punchline : "Tap to reveal punchline",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
