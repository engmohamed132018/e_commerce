import 'package:e_commerce/core/constant/app_color.dart';
import 'package:e_commerce/core/constant/app_size.dart';
import 'package:e_commerce/core/constant/app_style.dart';
import 'package:e_commerce/features/Auth/presentation/auth_widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomTextformField extends StatelessWidget {
  const CustomTextformField({
    super.key,
    required this.controller,
    required this.text,
    required this.hint,
  });
  final TextEditingController? controller;
  final String text;
  final String hint;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomText(
            text: text,
            textStyle: AppStyle.normaLAND14SizeStyle
                .copyWith(color: AppColor.greyColor),
          ),
          SizedBox(height: Appsize.setHeight(height: 12)),
          TextFormField(
            controller: controller,
            validator: (value) {
              if (value!.isEmpty) {
                return ' please enter data';
              } else {
                return null;
              }
            },
            // onSaved: onsaved,
            decoration: InputDecoration(
                focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColor.greenColor)),
                border: const UnderlineInputBorder(),
                hintText: hint),
          ),
        ],
      ),
    );
  }
}
