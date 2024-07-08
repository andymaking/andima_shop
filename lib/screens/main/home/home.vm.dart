import 'package:andima_shop/data/cache/constants.dart';
import 'package:andima_shop/data/routes/routes.dart';
import 'package:andima_shop/utils/dartz.x.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import '../../../data/model/get-product-response.dart';
import '../../base-vm.dart';

class HomeViewModel extends BaseViewModel {

  var searchController = TextEditingController();

  List<Items> products = [];
  List<Items> searchedProducts = [];

  onChange(String? val){
    var value = searchController.text.trim();
    if(value.isEmpty) {
      searchedProducts = products;
    }else{
      searchedProducts = products.where((element) => element.name!.toLowerCase().contains(val!.toLowerCase())).toList();
    }
    notifyListeners();
  }

  initializer(){
    getProducts();
  }

  navigateToProduct(Items product){
    appCache.product = product;
    navigationService.navigateTo(ProductDetailRoute);
  }

  getProducts()async{
    startLoader();
    try{
      var res = await repository.getProducts();
      if(res.isRight()){
        products = res.asRight().items??[];
        onChange("");
      }
      stopLoader();
      notifyListeners();
    }catch(err){
      debugPrint(err.toString());
      stopLoader();
    }
  }


}