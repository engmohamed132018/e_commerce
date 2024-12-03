import 'package:e_commerce/features/cart/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constant/app_color.dart';
import '../../../../../core/constant/app_size.dart';
import '../../../../../core/constant/app_string.dart';
import '../../../../../core/constant/app_style.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../Auth/presentation/auth_widgets/custom_text.dart';
import '../../../home_data/home_data_model/product_model.dart';

class ProductDetailFooterWidget extends StatelessWidget {
  const ProductDetailFooterWidget({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomText(
                text: AppString.price,
                textStyle: AppStyle.normaLAND12SizeStyle),
            CustomText(
                text: '\$${product.price}',
                textStyle: AppStyle.medumAND16SizeStyle
                    .copyWith(color: AppColor.greenColor)),
          ],
        ),
        AddButton(product: product),
      ],
    ));
  }
}

class AddButton extends StatelessWidget {
  const AddButton({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: Appsize.setWidth(width: 146),
        height: Appsize.setHeight(height: 50),
        child: CustomButton(
            text: AppString.add,
            onpressed: () {
              final data = {
                AppString.productFieldName: product.toJson(),
                AppString.count: 1
              };
              BlocProvider.of<CartCubit>(context)
                  .setCartIteem(data, product.title);
            }));
  }
}
