import 'package:flutter/material.dart';
import 'package:listmovie/core/constant/app_color.dart';
import 'package:listmovie/core/constant/app_icon.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  CustomAppBar(
      {Key? key,
      this.title,
      this.elevation,
      this.showBackButton,
      this.leadingWidget,
      this.navigate})
      : super(key: key);
  Widget? title;
  double? elevation;
  final bool? showBackButton;
  final Widget? leadingWidget;
  final String? navigate;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.bgColor,
      elevation: elevation ?? 0,
      leading: showBackButton == false
          ? leadingWidget
          : Builder(
              builder: (BuildContext context) => IconButton(
                  onPressed: () {
                    navigate != null
                        ? Navigator.pushNamed(context, navigate!)
                        : Navigator.pop(context);
                  },
                  icon: leadingWidget ?? AppIcons.backButton),
            ),
      title: Center(child: title),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
