import 'package:flutter/material.dart';

import '../../../../core/constant/app_color.dart';
import '../../../../core/constant/app_size.dart';
import 'home_function.dart';

class HomeSreachTextField extends StatelessWidget {
  const HomeSreachTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Appsize.setWidth(width: 16)),
      height: Appsize.setHeight(height: 49),
      child: TextField(
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              size: Appsize.setWidth(width: 18),
            ),
            border: outlineInputBorderStyle(),
            enabledBorder: outlineInputBorderStyle(),
            focusedBorder: outlineInputBorderStyle(),
            filled: true,
            fillColor: AppColor.greyColor.withOpacity(.1)),
      ),
    );
  }
}