import 'package:flutter/material.dart';

import '../../../../core/constant/app_color.dart';
import '../../../../core/constant/app_size.dart';
import '../../../../core/constant/app_string.dart';
import '../../../../core/constant/app_style.dart';
import '../../../../core/functions/public_functions.dart';
import '../../../Auth/presentation/auth_widgets/custom_text.dart';
import '../../home_data/home_data_model/product_model.dart';

class HomeExploreProductItemListView extends StatelessWidget {
  const HomeExploreProductItemListView({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppString.productDetailsScreenRoute,
            arguments: product);
      },
      child: FittedBox(
        child: Container(
          height: Appsize.setHeight(height: 320),
          width: Appsize.setWidth(width: 165),
          margin: EdgeInsets.all(Appsize.setHeight(height: 16)),
          color: AppColor.colorWhite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageCard(),
              customSizedBOxFromHeight(10),
              cardDetails(),
            ],
          ),
        ),
      ),
    );
  }

  Widget cardDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
            text: product.title, textStyle: AppStyle.medumAND16SizeStyle),
        customSizedBOxFromHeight(3),
        CustomText(
            text: product.description,
            textStyle: AppStyle.normaLAND12SizeStyle),
        customSizedBOxFromHeight(3),
        CustomText(
            text: '\$${product.price}',
            textStyle: AppStyle.medumAND16SizeStyle
                .copyWith(color: AppColor.greenColor)),
      ],
    );
  }

  Widget ImageCard() {
    return Container(
      height: Appsize.setHeight(height: 240),
      color: Colors.white,
      alignment: Alignment.center,
      padding: EdgeInsets.all(Appsize.setWidth(width: 30)),
      child: Hero(
        tag: product.id,
        child: FadeInImage.assetNetwork(
          placeholder: AppString.loadingImage,
          image: product.image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
