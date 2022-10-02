import 'package:flutter/material.dart';
import 'package:listmovie/common/appbar/app_bar.dart';

class BasePage extends StatefulWidget {
  BasePage(
      {Key? key,
      this.showAppBar,
      this.title,
      required this.body,
      this.elevation,this.showBackButton})
      : super(key: key);
  double? elevation;
  bool? showAppBar;
  Widget? title;
  Widget body;
  final bool? showBackButton;


  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: widget.showAppBar == false
          ? null
          : CustomAppBar(
              title: widget.title ?? Text(""),
              showBackButton:widget.showBackButton,
              elevation: widget.elevation,
            ),
      body: widget.body,
    );
  }
}
