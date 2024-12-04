import 'package:e_commerce/core/constant/app_style.dart';
import 'package:e_commerce/features/Auth/presentation/auth_widgets/custom_text.dart';
import 'package:e_commerce/features/cart/cubit/cart_cubit.dart';
import 'package:e_commerce/features/cart/cubit/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constant/app_size.dart';
import '../../../../core/functions/public_functions.dart';
import '../../data/cart_product_model.dart';
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    context.read<CartCubit>().getdata();

    return BlocConsumer<CartCubit, CartState>(
      builder: (context, state) {
        return state is CartAcsessData
            ? _buildCard(state.targetProduct)
            : state is CartSucsess
                ? const Center(
                    child: CircularProgressIndicator.adaptive(),
                  )
                : Center(
                    child: CustomText(
                        text: 'No DATA IN CART',
                        textStyle: AppStyle.boldAND30SizeStyle),
                  );
      },
      listener: (context, state) {
        print(state);
      },
    );
  }

  Column _buildCard(List<CartProduct> products) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.only(
                top: Appsize.setHeight(height: 56),
                left: Appsize.setWidth(width: 16),
                right: Appsize.setWidth(width: 16)),
            itemCount: products.length,
            itemBuilder: (BuildContext context, int index) {
              var item = products[index];
              return Container(
                height: Appsize.setHeight(height: 120),
                margin: EdgeInsets.only(
                  bottom: Appsize.setHeight(height: 20),
                ),
                child: Row(
                  children: [
                    _buildImage(item.product.image),
                    customSizedBOxFromWidth(30),
                    CartProductDetails(item: item),
                  ],
                ),
              );
            },
          ),
        ),
        const cartcheckoutFooterAndText(),
      ],
    );
  }

  SizedBox _buildImage(String imge) {
    return SizedBox(
      width: Appsize.setWidth(width: 120),
      child: Image.network(
        imge,
        // fit: BoxFit.cover,
      ),
    );
  }
}
