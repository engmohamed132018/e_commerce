// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_commerce/core/cache/cache_helper.dart';
import 'package:flutter/material.dart';

import 'package:e_commerce/app_route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'core/functions/public_functions.dart';
import 'firebase_options.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupGetItregisterSingleton();
  await getIt<CacheHelper>().init();

  runApp(Ecommerce(
    appRoute: AppRoute(),
  ));
}

class Ecommerce extends StatelessWidget {
  const Ecommerce({
    super.key,
    required this.appRoute,
  });
  final AppRoute appRoute;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: const Locale('en'),
      localizationsDelegates: localizationsDelegates,
      supportedLocales: S.delegate.supportedLocales,
      title: 'Ecommerce',
      onGenerateRoute: appRoute.onGeneratRoute,
    );
  }
}
