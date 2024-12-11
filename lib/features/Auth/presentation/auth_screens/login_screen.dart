import 'package:e_commerce/core/constant/app_color.dart';
import 'package:e_commerce/core/constant/app_string.dart';
import 'package:e_commerce/core/constant/app_style.dart';
import 'package:e_commerce/features/Auth/presentation/auth_functions.dart';
import 'package:e_commerce/features/Auth/presentation/auth_widgets/custom_text.dart';
import 'package:flutter/material.dart';

import '../../../../core/constant/app_size.dart';
import '../../../../core/widgets/logo_widget.dart';
import '../auth_widgets/container_background.dart';
import '../auth_widgets/custom_signin_form.dart';

// ignore: must_be_immutable
class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> animationSlidePostion;
  late Animation<Offset> animation;
  @override
  void initState() {
    initController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: Appsize.setWidth(width: 20)),
        child: Column(
          children: [
            SizedBox(height: Appsize.setHeight(height: 120)),

            SlideTransition(
              position: animation,
              child: LogoWidget(),
            ),

            SizedBox(height: Appsize.setHeight(height: 60)),

            //!card form
            FadeTransition(
              opacity: controller,
              child: ContainerOfSignScreens(
                child: SlideTransition(
                    position: animation, child: buildwidget(context)),
              ),
            ),
            SizedBox(
                height:
                    Appsize.setHeight(height: Appsize.setHeight(height: 30))),
            //! social media
            // SocialMediaButton(
            //   onpressed: () {},
            //   image: AppString.facebook,
            //   text: AppString.signInwithFacebook,
            // ),
            // SizedBox(height: Appsize.setHeight(height: 20)),
            // SocialMediaButton(
            //   onpressed: () {},
            //   image: AppString.google,
            //   text: AppString.signInwithGoogle,
            // ),
          ],
        ),
      ),
    );
  }

  Widget buildwidget(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        signInWelcomeAndButtonPart(context),
        SizedBox(height: Appsize.setHeight(height: 10)),
        CustomText(
          text: AppString.signInToContinue,
          textStyle:
              AppStyle.normaLAND14SizeStyle.copyWith(color: AppColor.greyColor),
        ),
        SizedBox(height: Appsize.setHeight(height: 45)),
        SignInForm(),
        SizedBox(height: Appsize.setHeight(height: 10)),
      ],
    );
  }

  Row signInWelcomeAndButtonPart(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      textBaseline: TextBaseline.alphabetic,
      children: [
        singupSignInHeadertext(text: AppString.welcome),
        _signIntextButton(context),
      ],
    );
  }

  TextButton _signIntextButton(context) {
    return TextButton(
        onPressed: () {
          Navigator.pushNamed(context, AppString.signUpScreenRoute);
        },
        child: Text(
          AppString.signUp,
          style: AppStyle.normaLAND18SizeStyle
              .copyWith(color: AppColor.greenColor),
        ));
  }

  void initController() {
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    animationSlidePostion =
        Tween<Offset>(begin: Offset(-1, -1), end: Offset.zero).animate(
            CurvedAnimation(parent: controller, curve: Curves.bounceInOut));
    animation = Tween<Offset>(begin: Offset(0, -3), end: Offset.zero)
        .animate(CurvedAnimation(parent: controller, curve: Curves.bounceOut));

    controller.forward();
  }
}
