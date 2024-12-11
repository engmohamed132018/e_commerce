import 'package:e_commerce/core/cache/cache_helper.dart';
import 'package:e_commerce/core/constant/app_string.dart';
import 'package:e_commerce/core/functions/public_functions.dart';
import 'package:e_commerce/features/home/home_bloc/cubit/home_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/custom_list_tile_widget.dart';
import '../widgets/profile_header.dart';

class ProflileScreen extends StatelessWidget {
  const ProflileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //!header part
            ProfileHeader(),
            customSizedBOxFromHeight(105),

            CustomListTile(
              iconData: Icons.edit_outlined,
              onpressed: () {},
              text: AppString.editProfile,
            ),
            customSizedBOxFromHeight(20),
            CustomListTile(
              iconData: Icons.location_on_outlined,
              onpressed: () {},
              text: AppString.shippingAddress,
            ),
            customSizedBOxFromHeight(20),
            CustomListTile(
              iconData: Icons.alarm_sharp,
              onpressed: () {},
              text: AppString.orderHistory,
            ),
            customSizedBOxFromHeight(20),
            CustomListTile(
              iconData: Icons.card_travel_outlined,
              onpressed: () {
                BlocProvider.of<HomeCubit>(context).setNavBarIndex(1);
              },
              text: AppString.cards,
            ),
            customSizedBOxFromHeight(20),
            CustomListTile(
              iconData: Icons.notification_important_outlined,
              onpressed: () {},
              text: AppString.notifications,
            ),
            customSizedBOxFromHeight(20),
            CustomListTile(
              iconData: Icons.login_rounded,
              onpressed: () async {
                await FirebaseAuth.instance.signOut();
                getIt<CacheHelper>().removeData(key: AppString.token);
                Navigator.pushNamedAndRemoveUntil(
                    context, AppString.signInScreenRoute, (route) => false);
              },
              text: AppString.logOut,
            ),
          ],
        ),
      ),
    );
  }
}
