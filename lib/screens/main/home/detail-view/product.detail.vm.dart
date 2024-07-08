import 'package:andima_shop/utils/string-extensions.dart';

import '../../../../data/cache/network_config.dart';
import '../../../../data/model/get-product-response.dart';
import '../../../../localization/locales.dart';
import '../../../base-vm.dart';

class ProductDetailViewModel extends BaseViewModel {
  Items product = Items();
  List<Photos> images =[];
  List<String> imagesString =[];
  CurrentPrice? prices = CurrentPrice();
  String image = "";

  init(){
    product = appCache.product;
    List<Photos> images = product.photos??[];
    imagesString = images.map((e) => NetworkConfig.IMAGES_URL+(e.url??"")).toList();
    prices = product.currentPrice?.length == 0? null: product.currentPrice?.first;
    image = images.isEmpty? LocaleData.productCover.convertString(): NetworkConfig.IMAGES_URL+(images.last.url??"");
    notifyListeners();
  }

  int currentIndex = 0;

  onChanged(int? index){
    currentIndex = index??0;
    notifyListeners();
  }


}