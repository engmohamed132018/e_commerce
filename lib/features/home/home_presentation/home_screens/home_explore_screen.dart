import 'package:e_commerce/features/home/home_bloc/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constant/app_string.dart';
import '../../../../core/constant/app_style.dart';
import '../../../../core/functions/public_functions.dart';
import '../../../Auth/presentation/auth_widgets/custom_text.dart';
import '../home_widgets/home_category_listview.dart';
import '../home_widgets/home_explore_listview.dart';
import '../home_widgets/home_search_textfield.dart';

class HomeExploreScreen extends StatelessWidget {
  const HomeExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          customSizedBOxFromHeight(65),
          HomeSreachTextField(
            products: BlocProvider.of<HomeCubit>(context).products,
          ),
          customSizedBOxFromHeight(44),
          CustomText(
              text: AppString.categories,
              textStyle: AppStyle.boldAND18SizeStyle),
          customSizedBOxFromHeight(18),
          //!category list
          const HomeCategoryListView(),
          _buildBestSellAndSeeAll(),
          customSizedBOxFromHeight(27),
          const HomeExploreListView()
        ],
      ),
    );
  }

  Row _buildBestSellAndSeeAll() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
            text: AppString.bestSelling,
            textStyle: AppStyle.boldAND18SizeStyle),
        CustomText(
            text: AppString.seeAll, textStyle: AppStyle.normalAND16SizeStyle),
      ],
    );
  }
}
