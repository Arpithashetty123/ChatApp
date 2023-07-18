import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
class MyHomePage extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTap;

  const MyHomePage({super.key, required this.currentIndex, required this.onTap});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  int _cIndex = 0;

  void _incrementTab(index) {
    setState(() {
      _cIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return  Scaffold(
     
      bottomNavigationBar:BottomNavigationBar(
        currentIndex: _cIndex,
        type: BottomNavigationBarType.fixed ,
        items:  const [
          BottomNavigationBarItem(
            icon: Icon(MaterialCommunityIcons.web,color: Color.fromARGB(255, 0, 0, 0)),
            label: ""
       
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesome.wechat,color: Color.fromARGB(255, 0, 0, 0),),
              label: ""
          ),
          BottomNavigationBarItem(
            icon: Icon(Ionicons.call_outline,color: Color.fromARGB(255, 0, 0, 0)),
               label: ""
          ),
          BottomNavigationBarItem(
            icon: Icon(AntDesign.setting,color: Color.fromARGB(255, 0, 0, 0)),
             label: ""
          )
        ],
        onTap: (index){
            _incrementTab(index);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton:  FloatingActionButton(
        
        onPressed:(){ _incrementTab(1); },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), 
    );
  }
}