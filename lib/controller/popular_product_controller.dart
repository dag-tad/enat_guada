import 'package:enat_guada/controller/cart_controller.dart';
import 'package:enat_guada/models/products_model.dart';
import 'package:enat_guada/util/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/repository/popular_product_repo.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});

  List<ProductModel> _popularProductList = [];
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  List<ProductModel> get popularProductList => _popularProductList;
  late CartController _cart;
  int _quantity = 0;
  int get quantity => _quantity;
  int _inCartItems = 0;
  int get inCartItems => _inCartItems + _quantity;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();

    if (response.statusCode == 200) {
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      _isLoaded = true;
      update();
    } else {
      _isLoaded = false;
    }
  }

  void setQuantity(bool isIncreament) {
    if (isIncreament) {
      _quantity = checkQuantity(_quantity + 1);
    } else {
      _quantity = checkQuantity(_quantity - 1);
    }
    update();
  }

  int checkQuantity(int qty) {
    if ((_inCartItems + qty) < 0) {
      Get.snackbar("Item count", "Quantity must be greater than 0!",
          backgroundColor: AppColors.mainColor, colorText: Colors.white);
      return -_inCartItems;
    } else if ((_inCartItems + qty) > 20) {
      Get.snackbar("Item count", "Quantity must be less than 20!",
          backgroundColor: AppColors.mainColor, colorText: Colors.white);
      return 20;
    } else {
      return qty;
    }
  }

  void initProduct(ProductModel product, CartController cart) {
    _quantity = 0;
    _inCartItems = 0;

    _cart = cart;
    var exist = false;
    exist = _cart.existInCart(product);

    if(exist) {
      _inCartItems = _cart.getQuantity(product);
    }
  }

  void addItem(ProductModel product) {
      _cart.addItem(product, _quantity);
      _quantity = 0;
      _inCartItems = _cart.getQuantity(product);
      update();
  }

  int get totalItems => _cart.totalItems;
}
