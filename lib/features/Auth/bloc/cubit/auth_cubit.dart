import 'package:e_commerce/core/cache/cache_helper.dart';
import 'package:e_commerce/core/constant/app_string.dart';
import 'package:e_commerce/core/functions/public_functions.dart';
import 'package:e_commerce/features/Auth/data/auth_database/auth_firebase_consumer.dart';
import 'package:e_commerce/features/Auth/data/auth_repo/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  TextEditingController emailController = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  AuthFireBaseConsumer authFireBaseConsumer = AuthFireBaseConsumer();
  AuthRepo authRepo = AuthRepo(auth: AuthFireBaseConsumer());

  createUserWithEmailAndPassword() async {
    emit(Authloadingstate());

    try {
      final user = await authFireBaseConsumer.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);

      emit(AuthscussesState(user: user));
    } catch (e) {
      emit(AuthfailureState(message: e.toString()));
    }
  }

  signInWithEmailAndPassword() async {
    emit(AuthSignInloadingsState());
    try {
      final UserCredential user = await authRepo.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      final token = await user.user!.getIdToken();
      getIt<CacheHelper>().saveData(key: AppString.token, value: token);
      getIt<CacheHelper>().saveData(key: AppString.uid, value: user.user!.uid);
      emit(AuthSignInScussesState(token: token!, uid: user.user!.uid));
    } catch (e) {
      emit(AuthSignInFailureState(error: e));
    }
  }
}
