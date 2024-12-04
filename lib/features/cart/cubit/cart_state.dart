import 'package:e_commerce/features/cart/data/cart_product_model.dart';

class CartState {}

final class CartInitial extends CartState {}

final class CartSucsess extends CartState {}

final class CartAcsessData extends CartState {
  final List<CartProduct> targetProduct;

  CartAcsessData({required this.targetProduct});
}

final class CartfailarData extends CartState {}
