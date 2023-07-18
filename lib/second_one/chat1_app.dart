import 'package:chatapp/second_one/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import '../model/message_model.dart';
import '../model/reply_model.dart';
import 'app_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({
    super.key,
  });
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  int _cIndex = 0;

  void _incrementTab(index) {
    setState(() {
      _cIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
       
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assests/images/chat3.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
            child: Column(
              children: [
                const SearchAppBar(),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(top: 10),
                    child: ListView.builder(
                      itemCount: chats.length,
                      itemBuilder: (context, index) {
                        final chat = chats[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return ProfileScreen(
                                    user: chat.sender, dummyReplies: dummyReplies);
                              },
                            ));
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Container(
                              height: 75,
                              width: 400,
                              decoration: BoxDecoration(
                                  color:Colors.white30,
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 2,
                                      offset: const Offset(4, 4),
                                      color: Colors.grey.shade500.withOpacity(0.2),
                                    )
                                  ]),
                              child: ListTile(
                       
                                leading: Container(
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: CircleAvatar(
                                    backgroundImage:
                                        AssetImage(chat.sender.imageUrl),
                                    child: Stack(
                                      children: [
                                        if (chat.sender.isOnline)
                                          const Positioned(
                                            bottom: 2,
                                            right: 0,
                                            child: CircleAvatar(
                                              radius: 5,
                                              backgroundColor: Colors.green,
                                            ),
                                          )
                                        else
                                          const SizedBox(
                                            height: 0,
                                            width: 0,
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                                title: Text(
                                  chat.sender.name,
                                  style: GoogleFonts.poppins(
                                      fontSize: 15, fontWeight: FontWeight.w700),
                                ),
                                subtitle: Text(chat.text,
                                    style: GoogleFonts.poppins(
                                        fontSize: 14, fontWeight: FontWeight.w500)),
                                trailing: Text(chat.time),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _cIndex,
          elevation: 0,
          backgroundColor: Color.fromARGB(97, 14, 26, 33),
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(MaterialCommunityIcons.web,
                    color: Color.fromARGB(255, 0, 0, 0)),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(
                  FontAwesome.wechat,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(Ionicons.information_circle,
                    color: Color.fromARGB(255, 0, 0, 0)),
                label: ""),
            BottomNavigationBarItem(
                icon:
                    Icon(AntDesign.setting, color: Color.fromARGB(255, 0, 0, 0)),
                label: "")
          ],
          onTap: (index) {
            _incrementTab(index);
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _incrementTab(1);
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
