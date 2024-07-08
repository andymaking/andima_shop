import 'dart:convert';

import 'package:andima_shop/utils/dartz.x.dart';
import 'package:andima_shop/utils/snack_message.dart';
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

  addToCard(Items item)async{
    var res = await getCart();
    if(res!=null){
      List<Items> items = res;
      if(items.any((element) => element == item)){
        showCustomToast("${item.name} Already in cart");
      }else{
        items.add(item);
        await storageService.storeItem(key: StorageKey.PRODUCTS, value: getItemsDataListToJson(items));
        showCustomToast("${item.name} added to cart successfully");
      }
    }else{
      List<Items> items = [item];
      await storageService.storeItem(key: StorageKey.PRODUCTS, value: getItemsDataListToJson(items));
      showCustomToast("${item.name} added to cart successfully");
    }
  }

  Future<List<Items>?> getCart()async{
    var res = await storageService.read(key: StorageKey.PRODUCTS);
    if(res != null){
      return getGetItemsDataListFromJson(res);
    }else{
      return null;
    }
  }


}