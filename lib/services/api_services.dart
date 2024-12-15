import 'dart:convert';
import 'package:http/http.dart' as http;


class Joke {
  final String type;
  final String setup;
  final String punchline;

  Joke({required this.type, required this.setup, required this.punchline});

  factory Joke.fromJson(Map<String, dynamic> json) {
    return Joke(
      type: json['type'],
      setup: json['setup'],
      punchline: json['punchline'],
    );
  }
}

class ApiService {
  static const baseUrl = "https://official-joke-api.appspot.com";
  static Future<List<String>> fetchJokeTypes() async {
    final response = await http.get(Uri.parse("$baseUrl/types"));
    if (response.statusCode == 200) {
      return List<String>.from(json.decode(response.body));
    } else {
      throw Exception("Failed to load joke types!");
    }
  }

  static Future<List<Joke>> fetchJokesByType(String type) async {
    final response = await http.get(Uri.parse("$baseUrl/jokes/$type/ten"));
    if (response.statusCode == 200) {
      Iterable list = json.decode(response.body);
      return list.map((json) => Joke.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load jokes!");
    }
  }

  static Future<Joke> fetchRandomJoke() async {
    final response = await http.get(Uri.parse("$baseUrl/random_joke"));
    if (response.statusCode == 200) {
      return Joke.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load random joke!");
    }
  }
}
