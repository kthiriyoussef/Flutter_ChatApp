import 'package:chatapp/pages/chat_page.dart';
import 'package:chatapp/pages/registration_page.dart';
import 'package:chatapp/services/authService.dart';
import 'package:chatapp/widgets/custom_button.dart';
import 'package:chatapp/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class Login_page extends StatelessWidget {
   Login_page({super.key});
   static String id='LoginPage';
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
            height: 300,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Chat app',
                style: TextStyle(
                  fontSize: 32,
                  fontFamily: 'pacifico',
                  color: Colors.white,
      
                ),
                ),
              ],
            ),
            Row(
              children: [
                
                Text('LOGIN',
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
            onTap: () async {
              bool loginToken = await authService.loginUser(
                    email!,password!
                    
                  );
                  if(loginToken){
                    Navigator.pushNamed(context, ChatPage.id);
                    
                  }
                  else{
                    print(email);
                    print(password);
                  }

            },
            text: 'Login',
           ),
           Container(
                  height: 5,
                ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            Text('dont have any account ? ',
            style: TextStyle( 
              color: Colors.white
              ),
              ),
              GestureDetector(
                onTap: ()
                {
                  Navigator.pushNamed(context, Register_page.id);
                },


                child: Text(' Register',
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