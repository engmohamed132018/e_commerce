import 'package:flutter/material.dart';

import '../../../../core/constant/app_size.dart';

OutlineInputBorder outlineInputBorderStyle() {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(Appsize.setRaduis(raduis: 20)),
      borderSide: BorderSide(color: Colors.transparent));
}
