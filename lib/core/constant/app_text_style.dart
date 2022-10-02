import 'package:flutter/material.dart';
import 'package:listmovie/core/constant/app_color.dart';

class AppTextStyle{

  static const head = TextStyle(
    color: AppColors.textColor,
    fontSize: 22
  );
  static const title = TextStyle(
    color: AppColors.textColor,
    fontSize: 24,
    fontWeight: FontWeight.bold
  );
  static const date =TextStyle(
    color: AppColors.labelTextColor,
    fontStyle: FontStyle.italic
  );


  static const body = TextStyle(
    color: AppColors.labelTextColor,
    fontSize: 14
  );
  static const paragraph = TextStyle(
    letterSpacing: 1.5,
  );
}