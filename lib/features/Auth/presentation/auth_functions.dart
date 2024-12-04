import 'package:e_commerce/core/cache/cache_helper.dart';
import 'package:e_commerce/core/constant/app_string.dart';
import 'package:flutter/material.dart';
import '../../../core/constant/app_style.dart';
import '../../../core/functions/public_functions.dart';

waitingTime(context) {
  Future.delayed(const Duration(seconds: 2), () async {
    final token =
        await getIt<CacheHelper>().getDataString(key: AppString.token);
    if (token != null) {
      if (token.isEmpty) {
      } else {
        Navigator.pushReplacementNamed(context, AppString.homeScreenRoute);
      }
    } else {
      Navigator.pushReplacementNamed(context, AppString.signInScreenRoute);
    }
  });
}

Text singupSignInHeadertext({required String text}) {
  return Text(
    text,
    style: AppStyle.boldAND30SizeStyle,
  );
}
