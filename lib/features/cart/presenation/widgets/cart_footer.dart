import 'package:flutter/material.dart';

import '../../../../core/constant/app_color.dart';
import '../../../../core/constant/app_size.dart';
import '../../../../core/constant/app_string.dart';
import '../../../../core/constant/app_style.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../Auth/presentation/auth_widgets/custom_text.dart';

class cartcheckoutFooterAndText extends StatelessWidget {
  const cartcheckoutFooterAndText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Appsize.setHeight(height: 85),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildFooterText(),
          _buildFooterButton(),
        ],
      ),
    );
  }

  //!_buildFooterButton

  SizedBox _buildFooterButton() {
    return SizedBox(
        width: Appsize.setWidth(width: 150),
        child: CustomButton(text: AppString.checkoutWord, onpressed: () {}));
  }
  //!_buildFooterText

  Column _buildFooterText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomText(
            text: AppString.totalWord,
            textStyle: AppStyle.normaLAND12SizeStyle),
        CustomText(
            text: AppString.price.toString(),
            textStyle: AppStyle.boldAND18SizeStyle
                .copyWith(color: AppColor.greenColor)),
      ],
    );
  }
}
