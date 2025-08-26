import 'dart:convert';
import 'dart:ffi';
import 'package:http/http.dart' as http;

class User {
  final Long id;
  final String name;
  final String email;

  User({required this.id, required this.name,required this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }
}

class UserService {
  final String baseUrl = "https://test-gi25.onrender.com"; // or http://10.0.2.2:8080

  Future<List<User>> getUsers() async {
    final response = await http.get(Uri.parse("$baseUrl/users"));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((e) => User.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load users");
    }
  }

  Future<User> createUser(String name) async {
    final response = await http.post(
      Uri.parse("$baseUrl/users"),
      headers: {"Content-Type": "application/json"},
      body: json.encode({"name": name}),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to create user");
    }
  }
}
