import 'package:e_commerce/core/constant/app_color.dart';
import 'package:e_commerce/core/constant/app_string.dart';
import 'package:e_commerce/features/Auth/presentation/auth_functions.dart';
import 'package:e_commerce/features/Auth/presentation/auth_widgets/custom_singnup_screen_form.dart';
import 'package:flutter/material.dart';

import '../../../../core/constant/app_size.dart';
import '../../../../core/widgets/logo_widget.dart';
import '../auth_widgets/container_background.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> animation;
  late Animation<Offset> positionAnimation;

  @override
  void initState() {
    super.initState();
    initController();
  }

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
            SlideTransition(position: animation, child: LogoWidget()),
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
        CustomSignUpForm(
          positionAnimation: positionAnimation,
        ),
        SizedBox(
          height: Appsize.setHeight(height: 20),
        ),
      ],
    );
  }

  void initController() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animation = Tween<Offset>(begin: Offset(0, -1), end: Offset.zero).animate(
        CurvedAnimation(parent: animationController, curve: Curves.bounceOut));
    positionAnimation = Tween<Offset>(begin: Offset(2, 0), end: Offset.zero)
        .animate(CurvedAnimation(
            parent: animationController, curve: Curves.bounceInOut));
    animationController.forward();
  }
}
