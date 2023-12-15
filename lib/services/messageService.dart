import 'dart:convert';
import 'package:chatapp/services/authService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
class MessageService{
final storage = FlutterSecureStorage();
  AuthService authService=new AuthService();
Future<void> sendMessage(String message) async {
  final String baseUrl = 'http://10.0.2.2:3000'; // Replace with your server URL
  final String sendMessageUrl = '$baseUrl/send-message';
  
  // Replace 'yourToken' with the actual authentication token if needed
  final String? authToken = await authService.readToken();

  try {
    final response = await http.post(
      Uri.parse(sendMessageUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': '$authToken',
      },
      body: jsonEncode({'content': message}),
    );

    if (response.statusCode == 200) {
      print('Message sent successfully');
    } else {
      print('Error sending message: ${response.statusCode}');
      print(authToken);
    }
  } catch (error) {
    print('Error sending message: $error');
  }
}

void getMessages() async {
  final String apiUrl = 'http://10.0.2.2:3000/get-messages'; // Replace with your server URL

  final response = await http.get(
    Uri.parse(apiUrl),
    headers: {'Content-Type': 'application/json'},
  );

  if (response.statusCode == 200) {
    final List<dynamic> messages = jsonDecode(response.body);
    print('Messages: $messages');
  } else {
    print('Error retrieving messages: ${response.statusCode}');
  }
}
Future<List<Map<String, dynamic>>> getUserMessages() async {
  final String baseUrl = 'http://10.0.2.2:3000'; // Replace with your server URL
  final String userMessagesUrl = '$baseUrl/user-messages';

  // Replace 'yourToken' with the actual authentication token if needed
  final String? authToken = await authService.readToken();

  try {
    final response = await http.get(
      Uri.parse(userMessagesUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': '$authToken',
      },
    );

    if (response.statusCode == 200) {
      final List<Map<String, dynamic>> messages = List<Map<String, dynamic>>.from(jsonDecode(response.body));
      return messages;
    } else {
      print('Error retrieving messages: ${response.statusCode}');
      return [];
    }
  } catch (error) {
    print('Error retrieving messages: $error');
    return [];
  }
}
}