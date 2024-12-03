import 'package:e_commerce/core/constant/app_color.dart';
import 'package:e_commerce/core/constant/app_size.dart';
import 'package:e_commerce/features/home/home_bloc/cubit/home_cubit.dart';
import 'package:e_commerce/features/home/home_bloc/cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/cache/cache_helper.dart';
import '../../../../core/constant/app_string.dart';

class HomeNavBar extends StatefulWidget {
  const HomeNavBar({super.key});

  @override
  State<HomeNavBar> createState() => _HomeNavBarState();
}

class _HomeNavBarState extends State<HomeNavBar> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        print('===============================$state=========');
      },
      builder: (context, state) {
        return BottomNavigationBar(
          onTap: (value) {
            context.read<HomeCubit>().setNavBarIndex(value);
          },
          currentIndex: state is HomeNavBarScusses ? state.index : 0,
          iconSize: 24,
          selectedItemColor: AppColor.greenColor,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
                icon: _buildNavAppBarItem(AppString.exploreImge),
                label: "explore"),
            BottomNavigationBarItem(
                icon: _buildNavAppBarItem(AppString.cartImage), label: "cart"),
            BottomNavigationBarItem(
                icon: _buildNavAppBarItem(AppString.userimage),
                label: "profile"),
          ],
        );
      },
    );
  }

  SizedBox _buildNavAppBarItem(imageName) {
    return SizedBox(
      width: Appsize.setWidth(width: 50),
      height: Appsize.setHeight(height: 25),
      child: Image.asset(
        imageName,
      ),
    );
  }
}
