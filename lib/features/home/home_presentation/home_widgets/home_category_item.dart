import 'package:e_commerce/core/constant/app_string.dart';
import 'package:e_commerce/features/home/home_bloc/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constant/app_color.dart';
import '../../../../core/constant/app_size.dart';
import '../../../../core/constant/app_style.dart';
import '../../../../core/functions/category_list.dart';
import '../../../../core/functions/public_functions.dart';
import '../../../Auth/presentation/auth_widgets/custom_text.dart';

class HomeCategoryItem extends StatelessWidget {
  const HomeCategoryItem({
    super.key,
    required this.item,
  });

  final CategoryTestModel item;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Appsize.setHeight(height: 89),
      width: Appsize.setWidth(width: 60),
      margin: EdgeInsets.symmetric(horizontal: Appsize.setWidth(width: 14)),
      child: InkWell(
        onTap: () {
          final productsBycCategory =
              BlocProvider.of<HomeCubit>(context).productsByCategory(item.name);

          final argument = {
            AppString.name: item.name,
            AppString.resultListData: productsBycCategory,
          };

          Navigator.of(context).pushNamed(AppString.categoryResultScreenRoute,
              arguments: argument);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            __buildHomeCategoryImage(),
            customSizedBOxFromHeight(10),
            CustomText(
                text: item.name, textStyle: AppStyle.normaLAND12SizeStyle),
          ],
        ),
      ),
    );
  }

  CircleAvatar __buildHomeCategoryImage() {
    return CircleAvatar(
      backgroundColor: AppColor.colorWhite,
      radius: Appsize.setRaduis(raduis: 30),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(Appsize.setRaduis(raduis: 30)),
        child: Padding(
          padding: EdgeInsets.all(Appsize.setHeight(height: 10)),
          child: Image.asset(
            item.image,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
