import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/core/cache/cache_helper.dart';
import 'package:e_commerce/core/constant/app_color.dart';
import 'package:e_commerce/core/constant/app_size.dart';
import 'package:e_commerce/core/constant/app_string.dart';
import 'package:e_commerce/features/cart/presenation/screens/cartscreen.dart';
import 'package:e_commerce/features/home/home_bloc/cubit/home_state.dart';
import 'package:e_commerce/features/home/home_presentation/home_screens/home_explore_screen.dart';
import 'package:e_commerce/features/home/home_presentation/home_widgets/home_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../home_bloc/cubit/home_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> dataScreens = const [
    HomeExploreScreen(),
    CartScreen(),
    Text('dvhhdjd'),
  ];

  @override
  void initState() {
    BlocProvider.of<HomeCubit>(context).getAllProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColor.primaryColor,
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return state is HomeNavBarScusses
              ? dataScreens.elementAt(state.index)
              : dataScreens.elementAt(0);
        },
      ),
      bottomNavigationBar: const HomeNavBar(),
    );
  }
}
