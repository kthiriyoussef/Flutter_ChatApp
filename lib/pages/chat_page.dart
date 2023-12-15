import 'package:chatapp/services/messageService.dart';
import 'package:chatapp/widgets/ChatBubble.dart';
import 'package:flutter/material.dart';
 // Replace with the correct import path for your MessageService
 // Replace with the correct import path for your ChatBubble

class ChatPage extends StatefulWidget {
  static String id = 'ChatPage';

  @override
  _ChatPageState createState() => _ChatPageState();
}
class _ChatPageState extends State<ChatPage> {
  final MessageService messageService = MessageService();
  late Future<List<Map<String, dynamic>>> messagesFuture;

  @override
  void initState() {
    super.initState();
    // Call getUserMessages when the ChatPage is created
    
    messagesFuture = messageService.getUserMessages();
  }
 
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff31398c),
        title: Text('Chat'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<List<Map<String, dynamic>>>(
              future: messageService.getUserMessages(), // Assuming you have a method to retrieve messages
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (snapshot.hasData) {
                  List<Map<String, dynamic>> messages = snapshot.data!;
                  return ListView.builder(
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      return ChatBubble(message: messages[index]['content']);
                    },
                  );
                } else {
                  return Center(child: Text('No messages available'));
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              onSubmitted: (data) {
                messageService.sendMessage(data);
                
                 setState(() {
                    messagesFuture =messageService.getUserMessages();
                    data="";
    });
              },
              decoration: InputDecoration(
                hintText: 'Send Message',
                suffixIcon: Icon(
                  Icons.send,
                  color: Color(0xff31398c),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: Color(0xff31398c)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
