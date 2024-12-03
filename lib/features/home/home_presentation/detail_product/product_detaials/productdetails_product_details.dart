import 'package:flutter/material.dart';

import '../../../../../core/constant/app_size.dart';
import '../../../../../core/constant/app_string.dart';
import '../../../../../core/constant/app_style.dart';
import '../../../../../core/functions/public_functions.dart';
import '../../../../Auth/presentation/auth_widgets/custom_text.dart';
import '../../../home_data/home_data_model/product_model.dart';

class ProductDetailProductBody extends StatelessWidget {
  const ProductDetailProductBody({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Appsize.setWidth(width: 16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
              text: product.title, textStyle: AppStyle.boldAND30SizeStyle),
          customSizedBOxFromHeight(30),
          CustomText(
              text: AppString.details, textStyle: AppStyle.boldAND18SizeStyle),
          _buildProductDetails(product),
        ],
      ),
    );
  }

  _buildProductDetails(Product product) {
    return Text(
      product.description,
      style: AppStyle.normaLAND14SizeStyle
          .copyWith(height: 3, letterSpacing: 1, wordSpacing: 1.2),
      maxLines: 5,
      overflow: TextOverflow.ellipsis,
    );
  }
}
