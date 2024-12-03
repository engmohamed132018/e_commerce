import 'package:e_commerce/core/constant/app_string.dart';
import 'package:e_commerce/core/constant/app_style.dart';
import 'package:e_commerce/features/Auth/presentation/auth_widgets/custom_text.dart';
import 'package:e_commerce/features/home/home_presentation/home_widgets/homeexploreproductItem_listview.dart';
import 'package:flutter/material.dart';

class CategoryReultScreen extends StatelessWidget {
  const CategoryReultScreen({super.key, required this.result});
  final Map<String, dynamic> result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        centerTitle: true,
        title: CustomText(
            text: result[AppString.name],
            textStyle: AppStyle.boldAND18SizeStyle),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            // childAspectRatio: .5,
            // crossAxisSpacing: Appsize.setWidth(width: 10),
            // mainAxisSpacing: Appsize.setHeight(height: 10),
            mainAxisExtent: 360),
        itemCount: result[AppString.resultListData].length,
        itemBuilder: (BuildContext context, int index) {
          var product = result[AppString.resultListData][index];

          return HomeExploreProductItemListView(product: product);
        },
      ),
    );
  }
}
