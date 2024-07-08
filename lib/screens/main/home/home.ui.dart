import 'package:andima_shop/data/cache/network_config.dart';
import 'package:andima_shop/data/model/get-product-response.dart';
import 'package:andima_shop/localization/locales.dart';
import 'package:andima_shop/utils/shimmer_loaders.dart';
import 'package:andima_shop/utils/string-extensions.dart';
import 'package:andima_shop/utils/widget_extensions.dart';
import 'package:andima_shop/widget/text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widget/app-bar.dart';
import '../../../widget/app-card.dart';
import '../../../widget/apptexts.dart';
import '../../../widget/products-card.dart';
import '../../base-ui.dart';
import 'home.vm.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      onModelReady: (model)=> model.initializer(),
      builder: (_, model, theme, child)=> Scaffold(
        body: RefreshIndicator(
          onRefresh: ()async => model.initializer(),
          child: SafeArea(
            top: true,
            bottom: false,
            child: Padding(
              padding: 16.sp.padH,
              child: Column(
                children: [
                  10.sp.sbH,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: AppTextField(
                          controller: model.searchController,
                          onChanged: model.onChange,
                          hint: LocaleData.searchProduct.convertString(),
                          contentPadding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 12.sp),
                        ),
                      ),
                      0.sp.sbW,
                      ThemeButtons(
                        isDark: theme.isDark,
                        onTap: theme.changeTheme,
                      ),

                    ],
                  ),
                  16.sp.sbH,
                  Expanded(
                    child: model.searchedProducts.isEmpty && !model.isLoading? Center(child: const AppText("No Product")):
                    model.searchedProducts.isEmpty && model.isLoading?
                    GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 3,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 8.0,
                          crossAxisSpacing: 8.0,
                          childAspectRatio: (1 / 1.4),
                        ),
                        itemBuilder: (_,i){
                          return AppCard(
                            padding: 0.0.padA,
                            margin: (i % 2) == 1
                                ? const EdgeInsets.only(
                                left: 5,bottom: 5)
                                : const EdgeInsets.only(
                                right: 5, bottom: 5
                            ),
                            child: ShimmerCard(),
                          );
                        }
                    ):
                    GridView.builder(
                        itemCount: model.searchedProducts.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 8.0,
                          crossAxisSpacing: 8.0,
                          childAspectRatio: (1 / 1.4),
                        ),
                        itemBuilder: (_,i){
                          Items product = model.searchedProducts[i];
                          List<Photos> images = product.photos??[];
                          List<String> colors=[];
                          CurrentPrice? prices = product.currentPrice?.length == 0? null: product.currentPrice?.first;
                          String image = images.isEmpty? LocaleData.productCover.convertString(): NetworkConfig.IMAGES_URL+(images.first.url??"");
                          return ProductCard(
                            onTap: ()=> model.navigateToProduct(product),
                            image: image,
                            price: prices?.nGN??[],
                            i: i,
                            name: product.name??"",
                            description: product.description??"",
                            margin: (i % 2) == 1
                                ? const EdgeInsets.only(
                                left: 5,bottom: 5)
                                : const EdgeInsets.only(
                                right: 5, bottom: 5), colors: colors,
                          );
                        }
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
