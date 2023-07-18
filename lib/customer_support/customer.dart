import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomerScreen extends StatefulWidget {
  const CustomerScreen({Key? key}) : super(key: key);

  @override
  _CustomerScreenState createState() => _CustomerScreenState();
}

class _CustomerScreenState extends State<CustomerScreen> with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? _animation;
  final TextEditingController _textFieldController = TextEditingController();
  String? _currentMessage;
  final List<String> _messages = [];
  String? _userReply;
  bool _isTextFieldVisible = false;
  double _currentMessageFontSize = 25.0;
  bool _isButtonEnabled = true;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_animationController!)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          Future.delayed(const Duration(seconds: 2), () {
            setState(() {
              _isTextFieldVisible = true;
            });
          });
          _animationController?.reverse();
        }
      });
  }

  @override
  void dispose() {
    _animationController?.dispose();

    super.dispose();
  }

void _showFirstMessage() {
  if (!_isTextFieldVisible) {
    setState(() {
      if (_currentMessage != null && _currentMessage!.isNotEmpty) {
        _messages.add(_currentMessage!);
      }
      _currentMessage = 'Hello! How can I assist you today?';
      _isTextFieldVisible = false;
      _userReply = null;
      _isButtonEnabled = false;
    });
    _textFieldController.clear();
    _animationController?.forward(from: 1.0);
  }
}

  void _handleReply(String reply) {
    setState(() {
      _userReply = reply;
    });
  }

  void _sendMessage() {
    if (_userReply != null && _userReply!.isNotEmpty) {
      setState(() {
        _messages.add(_userReply!);
        _isTextFieldVisible = false;
        _isButtonEnabled = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: _isButtonEnabled ? _showFirstMessage : null,
          child: const Icon(Icons.chat),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assests/images/chatscreen.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                    child: AnimatedOpacity(
                      opacity: _currentMessage != null ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 500),
                      child: Text(
                        _currentMessage ?? '',
                        style: GoogleFonts.allerta(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: _currentMessageFontSize,
                        ),
                      ),
                    ),
                    onEnd: () {
                      setState(() {
                        _currentMessageFontSize = 30.0;
                      });
                    },
                  ),
                  const SizedBox(height: 16.0),
                  for (var message in _messages)
                    Text(
                      message,
                      style: GoogleFonts.allerta(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  const SizedBox(height: 16.0),
                  AnimatedOpacity(
                    opacity: _isTextFieldVisible ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 500),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _textFieldController,
                              style: const TextStyle(color: Colors.white),
                              onChanged: _handleReply,
                              maxLines: null,
                              decoration: InputDecoration(
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 3,
                                    color: Color.fromARGB(255, 171, 112, 146),
                                  ),
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 4,
                                    color: Color.fromARGB(255, 171, 112, 146),
                                  ),
                                ),
                                hintText: 'Reply...',
                                hintStyle: GoogleFonts.poppins(color: Colors.white),
                                suffixIcon: IconButton(
                                  onPressed: _sendMessage,
                                  icon: const Icon(
                                    Icons.send,
                                    color: Color.fromARGB(255, 253, 180, 223),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
//I this there is one mistake, when i click floating action button second time i am not getting mesg from _curent mesg, 