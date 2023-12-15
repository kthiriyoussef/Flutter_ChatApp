import 'package:flutter/material.dart';

class custom_button extends StatelessWidget {
   custom_button({required this.text,required this.onTap});
  String text;
  VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTap,
      child: Container(
               decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
                width: double.infinity,
                height: 60,
                child: Center(child: Text(text)),
              ),
    );
  }
}