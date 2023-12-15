import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
   ChatBubble({required
    this.message
  });
  String message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.only(left: 16,top: 16,bottom: 16,right: 16),
        margin: EdgeInsets.symmetric(horizontal:16,vertical: 8 ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
            bottomRight:  Radius.circular(32),
          ),
          color:Color(0xff31398c) ),
        child: Text(
          message,
          style: TextStyle(
            color: Colors.white,
          
        ),)),
    );
  }
}