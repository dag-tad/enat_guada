import 'package:enat_guada/data/repository/cart_repo.dart';
import 'package:enat_guada/models/products_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/cart_model.dart';
import '../util/app_colors.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;

  CartController({required this.cartRepo});

  Map<int, CartModel> _items = {};
  Map<int, CartModel> get items => _items;

  void addItem(ProductModel product, int quantity) {
    var totalQuantity = 0;
    if (_items.containsKey(product.id!)){
      _items.update(product.id!, (value) {
        totalQuantity = value.quantity! + quantity;

        return CartModel(
              id: value.id,
              img: value.img,
              name: value.name,
              isExist: true,
              price: value.price,
              quantity: value.quantity! + quantity,
              time: DateTime.now().toString()
            );});

        if(totalQuantity <= 0){
          _items.remove(product.id);
        }
    } else {
      if (quantity > 0) {
        _items.putIfAbsent(
        product.id!,
        () => CartModel(
              id: product.id,
              img: product.img,
              name: product.name,
              isExist: true,
              price: product.price,
              quantity: quantity,
              time: DateTime.now().toString()
            )
        );
      } else {
        Get.snackbar("Item count", "Quantity must be greater than 0!",
          backgroundColor: AppColors.mainColor, colorText: Colors.white);
      }
    }
  }

  bool existInCart(ProductModel product) => _items.containsKey(product.id);

  int getQuantity(ProductModel product){
    var qty = 0;
    if(_items.containsKey(product.id)){
      _items.forEach((key, value) {
        if(key == product.id){
          qty = value.quantity!;
        }
      });
    }
    return qty;
  }
}
