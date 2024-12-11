// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:e_commerce/core/constant/app_style.dart';
import 'package:e_commerce/features/Auth/presentation/auth_widgets/custom_text.dart';

import '../../../core/constant/app_color.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    Key? key,
    required this.text,
    required this.iconData,
    required this.onpressed,
  }) : super(key: key);
  final String text;
  final IconData iconData;
  final VoidCallback onpressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        iconData,
        color: AppColor.greenColor,
      ),
      title: CustomText(text: text, textStyle: AppStyle.normaLAND18SizeStyle),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: onpressed,
    );
  }
}
