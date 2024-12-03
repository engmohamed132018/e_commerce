import 'package:e_commerce/core/constant/app_color.dart';
import 'package:e_commerce/core/constant/app_size.dart';
import 'package:e_commerce/core/constant/app_string.dart';
import 'package:flutter/material.dart';

class AppStyle {
  static final boldAND30SizeStyle = TextStyle(
      fontFamily: AppString.fontName,
      fontSize: Appsize.setfont(font: 30),
      fontWeight: FontWeight.bold);

  static final normaLAND14SizeStyle = TextStyle(
      fontFamily: AppString.fontName,
      fontSize: Appsize.setfont(font: 14),
      fontWeight: FontWeight.w300,
      color: AppColor.blackColor);

  static final normaLAND12SizeStyle = TextStyle(
      fontFamily: AppString.fontName,
      fontSize: Appsize.setfont(font: 12),
      fontWeight: FontWeight.w600,
      color: AppColor.blackColor);

  static final normaLAND18SizeStyle = TextStyle(
      fontFamily: AppString.fontName,
      fontSize: Appsize.setfont(font: 18),
      fontWeight: FontWeight.w500);

  static final boldAND18SizeStyle = TextStyle(
      fontFamily: AppString.fontName,
      fontSize: Appsize.setfont(font: 18),
      fontWeight: FontWeight.w700);

  static final normalAND16SizeStyle = TextStyle(
      fontFamily: AppString.fontName,
      fontSize: Appsize.setfont(font: 16),
      fontWeight: FontWeight.w300);
  static final medumAND16SizeStyle = TextStyle(
      fontFamily: AppString.fontName,
      fontSize: Appsize.setfont(font: 16),
      fontWeight: FontWeight.w500);
}
