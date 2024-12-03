import 'package:e_commerce/features/home/home_presentation/detail_product/product_detaials/productdetails_product_details.dart';
import 'package:flutter/material.dart';

import '../../../../core/functions/public_functions.dart';
import '../../home_data/home_data_model/product_model.dart';
import 'product_detaials/product_details_footer_wiget.dart';
import 'product_detaials/productdetails_header.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProductDetailsScreenHeaderWidget(product: product),
        customSizedBOxFromHeight(30),
        ProductDetailProductBody(product: product),
        ProductDetailFooterWidget(product: product),
        customSizedBOxFromHeight(20),
      ],
    ));
  }
}
