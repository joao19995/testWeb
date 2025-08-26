import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:namer_app/model/user.dart';

class UserService {
  final String baseUrl = "https://test-gi25.onrender.com";

  Future<List<User>> getUsers() async {
    final response = await http.get(Uri.parse("$baseUrl/users"));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((e) => User.fromJson(e as Map<String, dynamic>)).toList();
    } else {
      throw Exception("Failed to load users");
    }
  }

  Future<User> createUser(String name, String email) async {
    final response = await http.post(
      Uri.parse("$baseUrl/users"),
      headers: {"Content-Type": "application/json"},
      body: json.encode({"name": name, "email": email}),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to create user");
    }
  }
}