import 'package:e_commerce/core/constant/app_string.dart';
import 'package:e_commerce/features/home/home_data/home_data_model/product_model.dart';

class CartProduct {
  final int count;
  final Product product;

  CartProduct({required this.count, required this.product});
  factory CartProduct.fromJson(Map<String, dynamic> json) {
    return CartProduct(
        count: json['count'],
        product: Product.fromJson(json[AppString.productFieldName]));
  }
}
