import 'package:e_commerce/features/cart/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constant/app_size.dart';
import '../../../../core/constant/app_string.dart';
import '../../../../core/functions/public_functions.dart';
import '../widgets/cart_footer.dart';
import '../widgets/cart_product_details.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    BlocProvider.of<CartCubit>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.only(
                top: Appsize.setHeight(height: 56),
                left: Appsize.setWidth(width: 16),
                right: Appsize.setWidth(width: 16)),
            itemCount: 20,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: Appsize.setHeight(height: 120),
                margin: EdgeInsets.only(
                  bottom: Appsize.setHeight(height: 20),
                ),
                child: Row(
                  children: [
                    _buildImage(),
                    customSizedBOxFromWidth(30),
                    const CartProductDetails(),
                  ],
                ),
              );
            },
          ),
        ),
        const cartcheckoutFooterAndText()
      ],
    );
  }

  SizedBox _buildImage() {
    return SizedBox(
      width: Appsize.setWidth(width: 120),
      child: Image.asset(
        AppString.google,
        // fit: BoxFit.cover,
      ),
    );
  }
}
