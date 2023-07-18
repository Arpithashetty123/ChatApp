import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import '../model/reply_model.dart';
import '../model/user_model.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
class Message{
  final String text;
  final DateTime timestamp;
  final bool isSent;
  Message({required this.text, required this.timestamp, required this.isSent});
}
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key, required this.user, required this.dummyReplies}) : super(key: key);
  final User user;
  final List<DummyReply> dummyReplies;
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}
class _ProfileScreenState extends State<ProfileScreen> {
 final TextEditingController _messageController=TextEditingController();
 final List<Message> messages=[];
 bool isTyping = false;
  @override
  void dispose(){
    _messageController.dispose();
    super.dispose();
  }
     @override
  void initState() {
    super.initState();
    _messageController.addListener(_handleTyping); 
  }
int replyIndex=0;
void _sendMessage() {
  if (_messageController.text.isNotEmpty) {
    setState(() {
      final newMessage = Message(
        text: _messageController.text,
        timestamp: DateTime.now(),
        isSent: true,
      );
      messages.add(newMessage);
      _messageController.clear();
       isTyping = false;
    });
    if (widget.dummyReplies.isNotEmpty) {
      Future.delayed(const Duration(seconds: 3), () {
        final dummyReply = widget.dummyReplies[replyIndex % widget.dummyReplies.length];
        final newDummyReply = Message(
          text: dummyReply.text,
          timestamp: dummyReply.timestamp,
          isSent: false,
        );
        setState(() {
          messages.add(newDummyReply);
          replyIndex++;
        });
      });
    }
  }
}
  void _handleTyping() {
    setState(() {
      isTyping = _messageController.text.isNotEmpty;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
    backgroundColor: Colors.transparent,
    
        title: Center(
          child: Column(
             children: [
              Text(
                widget.user.name,
               
              ),
              if (isTyping)
                const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    'typing...',
                    style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500, 
                    fontStyle: FontStyle.italic),
                  ),
                ),
            ],
          ),
        ),
        actions: const [ 
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Icon(Ionicons.call),
          ),
      
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Icon(Ionicons.videocam),
          ),
        ],
        elevation: 0,
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(AntDesign.arrowleft, size: 25),
            );
          },
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assests/images/chat9.png"),
              ),
            ),
            // child: BackdropFilter(
            //   filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
            //   child: Container(
            //     color: Colors.black.withOpacity(0.05),
            //   ),
            // ),
          ),
          Positioned(
            bottom: 10,
            left: 10,
            right: 10,
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextField(
                      controller: _messageController,
                      maxLines: null,
                      decoration: InputDecoration(
                        hintText: '  Type a message...',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 55,
                  width: 55,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5, bottom: 1),
                    child: IconButton(
                      onPressed: _sendMessage,
                      icon: const Icon(MaterialIcons.send),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 20,
            left: 0,
            right: 0,
            bottom: 80,
            child: ListView.builder(
            itemCount: messages.length,
            itemBuilder: (context, index) {
        final message = messages[index];
        final formattedTime = DateFormat('HH:mm').format(message.timestamp);
        if (message.isSent) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 15),
        child: Align(
          alignment: Alignment.topRight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
             CircleAvatar(backgroundImage: AssetImage(widget.user.imageUrl),),
              BubbleSpecialOne(
                text: message.text,
                color: Colors.black,
                seen: true,
                sent: true,
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                formattedTime,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.9),
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      );
        } else {
      final previousMessageIsSent = index > 0 && messages[index - 1].isSent;
      final showReplyIndicator = !previousMessageIsSent; 
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (showReplyIndicator)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Container(
                    width: 4,
                    height: 4,
                    margin: const EdgeInsets.only(right: 8),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.lightGreen,
                    ),
                  ),
                ],
              ),
            ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 15),
            child: Row(
              children: [
                  const CircleAvatar(radius: 15,
                    backgroundColor: Colors.white,),
                BubbleSpecialOne(
                  text: message.text,
                  color: Colors.black,
                  seen: true,
                  sent: false,
                  isSender: false,
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  formattedTime,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      );
        }
      },
      )
          ),
        ],
      ),
    );
  }
}
