import 'dart:convert';

import 'package:andima_shop/utils/dartz.x.dart';
import 'package:dartz/dartz.dart';

import '../../locator.dart';
import '../cache/constants.dart';
import '../cache/database-keys.dart';
import '../model/default.model.dart';
import '../model/get-product-response.dart';
import '../services/web/shop.service.dart';

ShopService _shopService = locator<ShopService>();

class Repository {

  Future<Either<ResModel, GetProductResponse>> getProducts() async {
    var response = await _shopService.getProducts();
    return response;
  }

  Future<Either<ResModel, Items>> getProduct({
    required String productID
  }) async {
    var response =  await _shopService.getProduct(productID: productID);
    return response;
  }


}