import 'package:e_commerce/core/constant/app_color.dart';
import 'package:e_commerce/core/constant/app_style.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, required this.onpressed});
  final String text;
  final VoidCallback onpressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onpressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.greenColor,
          minimumSize: Size(double.infinity, 50),
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          )),
      child: Text(
        text,
        style:
            AppStyle.normaLAND14SizeStyle.copyWith(color: AppColor.colorWhite),
      ),
    );
  }
}
