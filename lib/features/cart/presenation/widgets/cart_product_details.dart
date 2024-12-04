import 'package:e_commerce/features/cart/data/cart_product_model.dart';
import 'package:flutter/material.dart';

import '../../../../core/constant/app_color.dart';
import '../../../../core/constant/app_size.dart';
import '../../../../core/constant/app_style.dart';
import '../../../../core/functions/public_functions.dart';
import '../../../Auth/presentation/auth_widgets/custom_text.dart';

class CartProductDetails extends StatelessWidget {
  const CartProductDetails({super.key, required this.item});
  final CartProduct item;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
              text: item.product.title,
              textStyle: AppStyle.medumAND16SizeStyle),
          customSizedBOxFromHeight(4),
          CustomText(
              text: '\$${item.product.price}',
              textStyle: AppStyle.medumAND16SizeStyle
                  .copyWith(color: AppColor.greenColor)),
          customSizedBOxFromHeight(16),
          _buildRemoveAndAddPart(),
        ],
      ),
    );
  }

  Container _buildRemoveAndAddPart() {
    return Container(
      color: AppColor.greyColor.withOpacity(.1),
      width: Appsize.setWidth(width: 95),
      height: Appsize.setHeight(height: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildAddAndRemoveIcon(
            Icons.add,
            () {},
          ),
          customSizedBOxFromWidth(24),
          CustomText(
              text: item.count.toString(),
              textStyle: AppStyle.normaLAND12SizeStyle),
          customSizedBOxFromWidth(24),
          _buildAddAndRemoveIcon(Icons.remove, () {}),
        ],
      ),
    );
  }

  InkWell _buildAddAndRemoveIcon(IconData iconData, VoidCallback onpressed) {
    return InkWell(
      onTap: onpressed,
      child: Icon(
        iconData,
        size: Appsize.setWidth(width: 10),
      ),
    );
  }
}
