import 'package:flutter/material.dart';

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat App'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16.0),
              children: [
                MessageBubble(
                  sender: 'John Doe',
                  message: 'Hey, how are you?',
                  isMe: false,
                ),
                MessageBubble(
                  sender: 'Jane Smith',
                  message: 'I\'m doing great, thanks!',
                  isMe: true,
                ),
                // Add more message bubbles here
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Type your message...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8.0),
                ElevatedButton(
                  onPressed: () {},
                  child: Icon(Icons.send),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MessageBubble extends StatelessWidget {
  final String sender;
  final String message;
  final bool isMe;

  MessageBubble({required this.sender, required this.message, required this.isMe});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            sender,
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 8.0),
            padding: EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: isMe ? Colors.blue : Colors.grey.shade300,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
                bottomLeft: isMe ? Radius.circular(16.0) : Radius.circular(0.0),
                bottomRight: isMe ? Radius.circular(0.0) : Radius.circular(16.0),
              ),
            ),
            child: Text(
              message,
              style: TextStyle(
                fontSize: 16.0,
                color: isMe ? Colors.white : Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Column(
                //   children: [
                //     for (var message in _messages)
                //       Text(
                //         message,
                //         style: GoogleFonts.allerta(
                //           color:Colors.white,
                //           fontWeight: FontWeight.bold,
                //           fontSize: 25,
                //         ),
                //       ),
                //   ]
                // ),




//give animation to fisrt mesg so that it starts from cnter and move towards top of the screen

/*   Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(    color: Colors.deepPurple,
            borderRadius:BorderRadius.circular(15) ),
        
           
           )   ,    
          SizedBox(height: 10,),*/