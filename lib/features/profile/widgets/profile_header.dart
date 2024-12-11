import 'package:e_commerce/core/constant/app_style.dart';
import 'package:e_commerce/core/functions/public_functions.dart';
import 'package:e_commerce/features/Auth/presentation/auth_widgets/custom_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../core/constant/app_size.dart';

class ProfileHeader extends StatelessWidget {
  ProfileHeader({
    super.key,
  });

  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Appsize.setHeight(height: 121),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.green,
            radius: Appsize.setRaduis(raduis: 60),
          ),
          Expanded(
              child: Column(
            children: [
              CustomText(
                  text: '${_auth.currentUser!.displayName}',
                  textStyle: AppStyle.boldAND30SizeStyle),
              customSizedBOxFromWidth(8),
              CustomText(
                  text: '${_auth.currentUser!.email}',
                  textStyle: AppStyle.normalAND16SizeStyle),
            ],
          ))
        ],
      ),
    );
  }
}
