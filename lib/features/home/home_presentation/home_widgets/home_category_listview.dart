import 'package:flutter/material.dart';

import '../../../../core/constant/app_size.dart';

import '../../../../core/functions/category_list.dart';
import 'home_category_item.dart';

class HomeCategoryListView extends StatelessWidget {
  const HomeCategoryListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Appsize.setHeight(height: 132),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categoryListTest.length,
          itemBuilder: (context, index) {
            var item = categoryListTest[index];
            return HomeCategoryItem(item: item);
          }),
    );
  }
}
