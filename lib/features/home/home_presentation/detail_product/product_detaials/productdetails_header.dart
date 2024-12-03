import 'package:flutter/material.dart';

import '../../../../../core/constant/app_color.dart';
import '../../../../../core/constant/app_size.dart';
import '../../../home_data/home_data_model/product_model.dart';

class ProductDetailsScreenHeaderWidget extends StatelessWidget {
  const ProductDetailsScreenHeaderWidget({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: product.id,
      child: Container(
        padding: EdgeInsets.only(
          top: Appsize.setHeight(height: 50),
          left: Appsize.setWidth(width: 16),
          right: Appsize.setWidth(width: 16),
        ),
        height: Appsize.setHeight(height: 196),
        decoration: BoxDecoration(
          color: AppColor.colorWhite,
          image: DecorationImage(
            fit: BoxFit.contain,
            image: NetworkImage(product.image),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios)),
            CircleAvatar(
              radius: Appsize.setRaduis(raduis: 20),
              backgroundColor: AppColor.greyColor.withOpacity(.15),
              child: const Icon(Icons.star_border),
            ),
          ],
        ),
      ),
    );
  }
}
