import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';

class SearchAppBar extends StatelessWidget {
  const SearchAppBar({Key? key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          flex: 6,
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white24,
              hintText: "Search message...",
              hintStyle: TextStyle(fontSize: 15, color: Colors.grey.shade400),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              prefixIcon: const Icon(AntDesign.search1,),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Container(
            height: 60,
            decoration: BoxDecoration(
                color: Colors.white24,
              borderRadius: BorderRadius.circular(10)),
          
            child: IconButton(
              onPressed: () {},
              icon: const Icon(FontAwesome.edit,color: Colors.black,),
            ),
          ),
        ),
      ],
    );
  }
}
