import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:e_commerce/core/cache/cache_helper.dart';
import 'package:e_commerce/core/constant/app_string.dart';
import 'package:e_commerce/features/Auth/presentation/auth_widgets/custom_text.dart';
import 'package:flutter/material.dart';
import '../../../core/constant/app_style.dart';
import '../../../core/functions/public_functions.dart';

waitingTime(context) {
  Future.delayed(const Duration(seconds: 2), () async {
    final token =
        await getIt<CacheHelper>().getDataString(key: AppString.token);
    Connectivity()
        .onConnectivityChanged
        .listen((List<ConnectivityResult> result) {
      if (result.contains(ConnectivityResult.mobile) ||
          result.contains(ConnectivityResult.wifi)) {
        if (token != null) {
          if (token.isEmpty) {
          } else {
            Navigator.pushReplacementNamed(context, AppString.homeScreenRoute);
          }
        } else {
          Navigator.pushReplacementNamed(context, AppString.signInScreenRoute);
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: CustomText(
                text: 'no internet please check network',
                textStyle: AppStyle.boldAND18SizeStyle),
          ),
        );
      }
    });
  });
}

Text singupSignInHeadertext({required String text}) {
  return Text(
    text,
    style: AppStyle.boldAND30SizeStyle,
  );
}
