import 'package:e_commerce/core/cache/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';

import '../../features/Auth/presentation/auth_widgets/custom_text.dart';
import '../../generated/l10n.dart';
import '../constant/app_color.dart';
import '../constant/app_size.dart';
import '../constant/app_style.dart';

final getIt = GetIt.instance;

void setupGetItregisterSingleton() {
  getIt.registerSingleton<CacheHelper>(CacheHelper());

// Alternatively you could write it if you don't like global variables
}

Future<dynamic> alertDialog(BuildContext context, dynamic state) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: CustomText(
          text: 'problem',
          textStyle: AppStyle.normaLAND18SizeStyle
              .copyWith(color: AppColor.greenColor)),
      content: SizedBox(
        width: 80,
        height: 80,
        child: Center(
          child: Text(state.error.toString()),
        ),
      ),
      icon: const Icon(
        Icons.report_problem_sharp,
        size: 50,
        color: AppColor.greenColor,
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: CustomText(
                text: 'ok',
                textStyle: AppStyle.normaLAND18SizeStyle
                    .copyWith(color: AppColor.greenColor)))
      ],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    ),
  );
}

SizedBox customSizedBOxFromHeight(double height) {
  return SizedBox(
    height: Appsize.setHeight(height: height),
  );
}

SizedBox customSizedBOxFromWidth(double width) {
  return SizedBox(
    width: Appsize.setWidth(width: width),
  );
}

Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates = const [
  S.delegate,
  GlobalMaterialLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,
  GlobalCupertinoLocalizations.delegate,
];
