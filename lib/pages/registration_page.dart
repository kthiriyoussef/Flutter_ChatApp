import 'package:chatapp/pages/chat_page.dart';
import 'package:chatapp/pages/login_page.dart';
import 'package:chatapp/services/authService.dart';
import 'package:chatapp/widgets/custom_button.dart';
import 'package:chatapp/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class Register_page extends StatelessWidget {
  Register_page({super.key});
  static String id='RegistrationPage';
  String? username;
  String? email;
  String? password;

   
  final AuthService authService=AuthService();
    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff31398c),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        
        child: ListView(
          
          children: [
            Image.network('https://icon-library.com/images/chat-app-icon/chat-app-icon-7.jpg',
            height: 300,
            ),
            Text('Chat app',
            style: TextStyle(
              fontSize: 32,
              fontFamily: 'pacifico',
              color: Colors.white,
      
            ),
            ),
            Row(
              children: [
                
                Text('Register',
                style: TextStyle(
                  fontSize: 32,
                  
                  color: Colors.white,
      
                ),
                ),
              ],
            ),
            Container(
                  height: 10,
                ),
                 custom_text_field(
                  onChanged: (data){
                     username = data;
                  },
              hinttext: 'enter Username',
            ),
            Container(
                  height: 10,
                ),
            custom_text_field(
            onChanged: (data){
                     email = data;
                  },
              hinttext: 'enter Email',
            ),
            Container(
                  height: 10,
                ),
            custom_text_field(
              onChanged: (data){
                     password = data;
                  },
              hinttext: 'enter Password',
            ),
            Container(
                  height: 6,
                ),
           custom_button(
            text: 'Register',
            onTap:() async {
              bool registrationResult = await authService.registerUser(
                    username!,email!,password!
                  );

                  if (registrationResult) {
                    print('User registered successfully');
                    Navigator.pushNamed(context, ChatPage.id);
                  } else {
                    print('User registration failed');
                  }
            }
           ),
           Container(
                  height: 5,
                ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            Text('Already have an account ? ',
            style: TextStyle( 
              color: Colors.white
              ),
              ),
              
              GestureDetector(
                
                onTap: ()
                {
                  Navigator.pop(context);
                },
                child: Text(' Login',
                style: TextStyle(
                  color: Color(0xffC7EDE6)
                ),),
              )
          ],)
          ]),
         
      ),
    );
  }
}