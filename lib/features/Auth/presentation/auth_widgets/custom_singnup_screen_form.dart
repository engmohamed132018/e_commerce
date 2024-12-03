import 'package:e_commerce/core/constant/app_size.dart';
import 'package:e_commerce/features/Auth/bloc/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constant/app_string.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../bloc/cubit/auth_state.dart';
import 'custome_textfield.dart';

// ignore: must_be_immutable
class CustomSignUpForm extends StatelessWidget {
  CustomSignUpForm({super.key});
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthscussesState) {
          Navigator.pushReplacementNamed(context, AppString.signInScreenRoute);
        }
      },
      child: SignUpForm(formKey: formKey, authCubit: context.read<AuthCubit>()),
    );
  }
}

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
    required this.formKey,
    required this.authCubit,
  });

  final GlobalKey<FormState> formKey;
  final AuthCubit authCubit;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextformField(
              controller: authCubit.namecontroller,
              text: AppString.name,
              hint: AppString.nameHint,
            ),
            SizedBox(
              height: Appsize.setHeight(height: 35),
            ),
            CustomTextformField(
              controller: authCubit.emailController,
              text: AppString.email,
              hint: AppString.emailHint,
            ),
            SizedBox(
              height: Appsize.setHeight(height: 35),
            ),
            CustomTextformField(
              controller: authCubit.passwordController,
              text: AppString.password,
              hint: AppString.passwordHint,
            ),
            SizedBox(
              height: Appsize.setHeight(height: 66),
            ),
            CustomButton(
                text: AppString.signUp,
                onpressed: () async {
                  if (formKey.currentState!.validate()) {
                    await authCubit.createUserWithEmailAndPassword();
                  }
                }),
          ],
        ));
  }
}
