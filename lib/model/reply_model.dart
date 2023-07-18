class DummyReply {
  final String text;
  final DateTime timestamp;

  DummyReply({
    required this.text,
    required this.timestamp,
  });
}

final List<DummyReply> dummyReplies = [
  DummyReply(
    text: 'Hello!',
    timestamp: DateTime.now(),
  ),
  DummyReply(
    text: 'Fine,u?',
    timestamp: DateTime.now(),
  ),

   DummyReply(
    text: 'All good',
    timestamp: DateTime.now(),
  ),
   DummyReply(
    text: 'yess offcourse',
    timestamp: DateTime.now(),
  ),
   DummyReply(
    text: 'I dont know',
    timestamp: DateTime.now(),
  ),
   DummyReply(
    text: 'Nice to meet you',
    timestamp: DateTime.now(),
  ),
   DummyReply(
    text: 'Bye Bye',
    timestamp: DateTime.now(),
  ),
  
];
