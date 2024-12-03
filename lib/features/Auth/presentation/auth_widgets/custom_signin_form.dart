import 'package:e_commerce/core/cache/cache_helper.dart';
import 'package:e_commerce/features/Auth/bloc/cubit/auth_cubit.dart';
import 'package:e_commerce/features/Auth/bloc/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constant/app_size.dart';
import '../../../../core/constant/app_string.dart';
import '../../../../core/constant/app_style.dart';
import '../../../../core/functions/public_functions.dart';
import '../../../../core/widgets/custom_button.dart';
import 'custom_text.dart';
import 'custome_textfield.dart';

// ignore: must_be_immutable
class SignInForm extends StatelessWidget {
  SignInForm({
    super.key,
  });
  GlobalKey<FormState> formkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final authCubit = BlocProvider.of<AuthCubit>(context);

    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSignInScussesState) {
          getIt<CacheHelper>()
              .saveData(key: AppString.token, value: state.token);
          getIt<CacheHelper>().saveData(key: AppString.token, value: state.uid);
          print('${state.uid} @@@@@@@@@@@@@@@@@@@@@@@@@@@@@');
          Navigator.pushNamedAndRemoveUntil(
            context,
            AppString.homeScreenRoute,
            (route) => false,
          );
        } else if (state is AuthSignInFailureState) {
          alertDialog(context, state);
        }
      },
      builder: (context, state) {
        return Form(
          key: formkey,
          child: Column(
            children: [
              CustomTextformField(
                  controller: authCubit.emailController,
                  text: AppString.email,
                  hint: AppString.emailHint),
              SizedBox(height: Appsize.setHeight(height: 30)),
              CustomTextformField(
                  controller: authCubit.passwordController,
                  text: AppString.password,
                  hint: AppString.passwordHint),
              SizedBox(height: Appsize.setHeight(height: 20)),
              Align(
                  alignment: Alignment.centerRight,
                  child: CustomText(
                      text: AppString.forgotPassword,
                      textStyle: AppStyle.normaLAND14SizeStyle)),
              SizedBox(height: Appsize.setHeight(height: 20)),
              state is AuthSignInloadingsState
                  ? const CircularProgressIndicator()
                  : CustomButton(
                      text: AppString.signin,
                      onpressed: () {
                        if (formkey.currentState!.validate()) {
                          authCubit.signInWithEmailAndPassword();
                        }
                      }),
            ],
          ),
        );
      },
    );
  }
}
