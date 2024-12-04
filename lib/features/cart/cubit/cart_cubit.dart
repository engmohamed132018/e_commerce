import 'package:e_commerce/features/cart/data/cart_firestore_consumer.dart';
import 'package:e_commerce/features/cart/data/cart_product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  CartFireStoreConsumer cartConsumer = CartFireStoreConsumer();

  setCartIteem(Map<String, dynamic> data, String title) {
    cartConsumer.setData(data, title);
  }

  getdata() async {
    List<CartProduct> cartProducts = [];

    try {
      emit(CartSucsess());

      final response = await cartConsumer.getData();
      for (var element in response) {
        cartProducts
            .add(CartProduct.fromJson(element.data() as Map<String, dynamic>));
      }
      print(cartProducts);
      emit(CartAcsessData(targetProduct: cartProducts));
    } catch (e) {
      print('error=============================================$e');
      emit(CartfailarData());
    }
  }
}
