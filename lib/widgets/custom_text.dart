import 'package:flutter/material.dart';

class custom_text_field extends StatelessWidget {
   custom_text_field({this.hinttext,this.onChanged});
   Function(String)? onChanged;
  String? hinttext;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: 
      InputDecoration(
        hintText: hinttext,
        hintStyle: TextStyle(
          color: Colors.white
        ),
        enabledBorder: 
        OutlineInputBorder(
          borderSide: BorderSide(
           color: Colors.white
          )
         )
       ),
    );
  }
}
