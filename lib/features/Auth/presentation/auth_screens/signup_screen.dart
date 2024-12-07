import 'package:e_commerce/core/constant/app_color.dart';
import 'package:e_commerce/core/constant/app_string.dart';
import 'package:e_commerce/features/Auth/presentation/auth_functions.dart';
import 'package:e_commerce/features/Auth/presentation/auth_widgets/custom_singnup_screen_form.dart';
import 'package:flutter/material.dart';

import '../../../../core/constant/app_size.dart';
import '../../../../core/widgets/logo_widget.dart';
import '../auth_widgets/container_background.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: Appsize.setWidth(width: 20)),
        child: Column(
          children: [
            SizedBox(
              height: Appsize.setHeight(height: 120),
            ),
            LogoWidget(),
            SizedBox(
              height: Appsize.setHeight(height: 40),
            ),
            ContainerOfSignScreens(
              child: buildwidget(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildwidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        singupSignInHeadertext(text: AppString.signUp),
        SizedBox(
          height: Appsize.setHeight(height: 40),
        ),
        CustomSignUpForm(),
        SizedBox(
          height: Appsize.setHeight(height: 20),
        ),
      ],
    );
  }
}
