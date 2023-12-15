
import 'package:chatapp/pages/chat_page.dart';
import 'package:chatapp/pages/login_page.dart';
import 'package:chatapp/pages/registration_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( Chatapp());
}

class Chatapp extends StatelessWidget{
  const Chatapp({Key? key }):super (key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        Login_page.id: (context) => Login_page(),
        Register_page.id : (context) => Register_page(),
        ChatPage.id : (context) => ChatPage(),
      },
  home: Login_page(),
    );
}
}