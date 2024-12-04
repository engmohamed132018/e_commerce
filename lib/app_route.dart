import 'package:e_commerce/core/constant/app_string.dart';
import 'package:e_commerce/features/Auth/bloc/cubit/auth_cubit.dart';
import 'package:e_commerce/features/Auth/presentation/auth_screens/login_screen.dart';
import 'package:e_commerce/features/Auth/presentation/auth_screens/signup_screen.dart';
import 'package:e_commerce/features/Auth/presentation/auth_screens/splash_screen.dart';
import 'package:e_commerce/features/cart/cubit/cart_cubit.dart';
import 'package:e_commerce/features/home/home_bloc/cubit/home_cubit.dart';
import 'package:e_commerce/features/home/home_data/home_data_model/product_model.dart';
import 'package:e_commerce/features/home/home_presentation/category_result/categoryresult.dart';
import 'package:e_commerce/features/home/home_presentation/detail_product/home_product_details__screen.dart';
import 'package:e_commerce/features/home/home_presentation/home_screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/cart/presenation/screens/cartscreen.dart';
import 'features/test/animation_test.dart';

class AppRoute {
  Route? onGeneratRoute(RouteSettings setting) {
    switch (setting.name) {
      //! splashScreenRoute
      case AppString.splashScreenRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case 'test':
        return MaterialPageRoute(builder: (_) => ImpolicitAnimationWidgets());
      //! home screen route
      case AppString.homeScreenRoute:
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => HomeCubit(),
                    ),
                    BlocProvider(
                      create: (context) => CartCubit(),
                    ),
                  ],
                  child: const HomeScreen(),
                ));
      //!signInScreenRoute
      case AppString.signInScreenRoute:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => AuthCubit(),
                  child: const SignInScreen(),
                ));
      //! product details route
      case AppString.productDetailsScreenRoute:
        if (setting.arguments is Product) {
          return MaterialPageRoute(
              builder: (_) => BlocProvider(
                    create: (context) => CartCubit(),
                    child: ProductDetailsScreen(
                        product: (setting.arguments) as Product),
                  ));
        }
//!signUpScreenRoute
      case AppString.signUpScreenRoute:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create: (_) => AuthCubit(), child: const SignUpScreen()));
      //! category Result
      case AppString.categoryResultScreenRoute:
        if (setting.arguments is Map<String, dynamic>) {
          return MaterialPageRoute(
              builder: (_) => CategoryReultScreen(
                  result: setting.arguments as Map<String, dynamic>));
        }
      //! cart screen route
      case AppString.cartScreenRoute:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => CartCubit(),
                  child: const CartScreen(),
                ));
      //! default route
      default:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
    }
    return null;
  }
}
