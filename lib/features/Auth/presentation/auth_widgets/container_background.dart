import 'package:flutter/material.dart';

import '../../../../core/constant/app_color.dart';
import '../../../../core/constant/app_size.dart';

class ContainerOfSignScreens extends StatelessWidget {
  const ContainerOfSignScreens({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
          left: Appsize.setWidth(width: 16),
          top: Appsize.setHeight(height: 12),
          right: Appsize.setWidth(width: 16)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColor.colorWhite,
        boxShadow: const [
          BoxShadow(blurRadius: 20, spreadRadius: 2, color: AppColor.greyColor)
        ],
      ),
      child: child,
    );
  }
}
