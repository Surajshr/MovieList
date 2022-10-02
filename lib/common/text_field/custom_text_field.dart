import 'package:flutter/material.dart';
import 'package:listmovie/features/screens/detail_page/detail_page.dart';

import '../../features/screens/search_deligate/search_deligate.dart';

class CustomTextField extends StatefulWidget {
   CustomTextField(
      {Key? key,
      required this.controller,
      this.hintText,
      this.prefixWidget,
      this.suffixWidget,this.onTap})
      : super(key: key);
  final TextEditingController controller;
  final String? hintText;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  Function()? onTap;
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        onTap: (){
          // widget.onTap;

          showSearch(context: context, delegate: MovieSearch());
          //Navigator.push(context, MaterialPageRoute(builder: (context)=>const DummyPage()));
        },
        readOnly: true,
        controller: widget.controller,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          hintText: widget.hintText,
          prefixIcon: widget.suffixWidget ??
              const Icon(
                Icons.search,
              ),
          suffix: widget.suffixWidget ?? const Icon(Icons.close),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
