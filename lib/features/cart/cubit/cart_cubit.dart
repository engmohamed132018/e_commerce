import 'package:e_commerce/core/constant/app_string.dart';
import 'package:e_commerce/features/cart/data/cart_firestore_consumer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  CartFireStoreConsumer cartConsumer = CartFireStoreConsumer();

  setCartIteem(Map<String, dynamic> data) {
    cartConsumer.setData(data,
        title: data[AppString.productFieldName][AppString.productTitle]);
  }
}
