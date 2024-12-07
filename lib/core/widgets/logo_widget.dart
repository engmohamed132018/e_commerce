import 'package:flutter/material.dart';

import '../constant/app_color.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            blurRadius: 100,
            spreadRadius: 1,
            offset: Offset(0, 10),
            color: Colors.greenAccent.withOpacity(.2)),
      ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text.rich(
            TextSpan(
                text: "E",
                style: TextStyle(
                    fontFamily: 'pac',
                    fontSize: 60,
                    color: AppColor.greenColor,
                    fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text: 'commerce',
                    style: TextStyle(
                        fontFamily: 'pac',
                        fontSize: 60,
                        color: AppColor.greenColor,
                        fontWeight: FontWeight.w300),
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}
