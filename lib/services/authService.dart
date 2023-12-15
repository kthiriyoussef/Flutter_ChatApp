import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class AuthService {
  final String baseUrl = 'http://10.0.2.2:3000'; 
  String Token="";
  final storage = FlutterSecureStorage();

Future<void> saveToken(String token) async {
  await storage.write(key: 'auth_token', value: token);
}

Future<String?> readToken() async {
  return await storage.read(key: 'auth_token');
}

  void storeToken(String token){
   Token=token;
  }
  getToken(){
    return Token;
  }

  Future registerUser(String username, String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/register'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'username': username, 'email': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      // Registration successful
      return true;
    } else {
      // Handle registration error
      print('Error registering user: ${response.statusCode}');
      return false;
    }
  }

  Future<bool> loginUser(String email, String password) async {
  try {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      // Login successful, extract the token
      final Map<String, dynamic> data = jsonDecode(response.body);
      String token = data['token'];

      // Save the token securely
      await saveToken(token);

      return true;
    } else {
      // Handle login error
      print('Error logging in: ${response.statusCode}');
      return false;
    }
  } catch (error) {
    // Handle network or other errors
    print('Error logging in: $error');
    return false;
  }
}
}