
import 'package:chatapp/model/user_model.dart';

class Message {
  final User sender;
  final String time; 
  final String text;
  final bool unread;
  final User reciver;
  Message({
    required this.reciver,
    required this.sender,
    required this.time,
    required this.text,
    required this.unread,
  });

  get isSent => null;
}
List<Message>chats=[
  Message(
    sender: ironMan,
    time: '5:30 PM',
    text: 'Hey dude!',
    unread: true,
    reciver: captainAmerica
  ),
  Message(
    sender: captainAmerica,
    time: '4:30 PM',
    text: 'Hey,',
    unread: true,
    reciver: blackWindow
  ),
  Message(
    reciver: currentUser,
    sender: hulk,
    time: '1:30 PM',
    text: 'HULK SMASH!!',
    unread: false,
  ),
  Message(
    sender: scarletWitch,
    time: '11:30 AM',
    text: 'Give me some time please.',
    unread: false,
    reciver: spiderMan
  ),
  Message(
    reciver: thor,
    sender: spiderMan,
    time: '2:30 PM',
    text: 'Hello',
    unread: true,
  ),
  Message(
    reciver: spiderMan,
    sender: blackWindow,
    time: '3:30 PM',
    text: 'WOW!',
    unread: false,
  ),
  Message(
    reciver: scarletWitch,
    sender: thor,
    time: '12:30 PM',
    text: 'I\'m hitting gym bro',
    unread: false,
  ),
  Message(
    reciver: currentUser,
    sender: captainMarvel,
    time: '12:45 AM',
    text: 'But you know my struggle.',
    unread: false,
  ),
   Message(
    reciver: scarletWitch,
    sender: thor,
    time: '12:30 PM',
    text: 'I\'m hitting gym bro',
    unread: false,
  ),
   Message(
    reciver: scarletWitch,
    sender: thor,
    time: '12:30 PM',
    text: 'I\'m hitting gym bro',
    unread: false,
  ),
];