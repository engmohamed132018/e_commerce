import 'package:e_commerce/core/constant/app_size.dart';
import 'package:flutter/material.dart';

import '../../../../core/constant/app_style.dart';
import 'custom_text.dart';

class SocialMediaButton extends StatelessWidget {
  const SocialMediaButton({
    super.key,
    required this.onpressed,
    required this.image,
    required this.text,
  });
  final VoidCallback onpressed;
  final String image;
  final String text;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: const BorderSide(width: 1),
      ),
      onPressed: () {},
      child: Row(
        children: [
          SizedBox(
            height: Appsize.setHeight(height: 20),
            width: Appsize.setWidth(width: 20),
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: Appsize.setWidth(width: 50),
          ),
          CustomText(text: text, textStyle: AppStyle.normaLAND14SizeStyle),
        ],
      ),
    );
  }
}
