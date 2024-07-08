import 'package:andima_shop/localization/locales.dart';
import 'package:andima_shop/utils/string-extensions.dart';
import 'package:andima_shop/utils/the.data.dart';
import 'package:andima_shop/utils/widget_extensions.dart';
import 'package:andima_shop/widget/app-button.dart';
import 'package:andima_shop/widget/app-card.dart';
import 'package:andima_shop/widget/apptexts.dart';
import 'package:andima_shop/widget/inidicator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../widget/app-bar.dart';
import '../../../base-ui.dart';
import 'product.detail.vm.dart';

class ProductDetailView extends StatelessWidget {
  const ProductDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<ProductDetailViewModel>(
      onModelReady: (model)=> model.init(),
      builder: (_, model, theme, child)=> Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: height(context)/3,
                  width: width(context),
                  child: Stack(
                    children: [
                      PageView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: model.imagesString.length,
                          onPageChanged: model.onChanged,
                          itemBuilder: (_, i){
                            return Hero(
                              tag: model.imagesString[i],
                              child: CachedNetworkImage(
                                width: width(context),
                                imageUrl: model.imagesString[i],
                                fit: BoxFit.cover,
                              ),
                            );
                          }
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: 16.sp.padB,
                          child: Indicators(
                            total: model.imagesString.length,
                            current: model.currentIndex
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.only(
                      top: 16.sp, left: 16.sp, right: 16.sp
                    ),
                    children: [
                      AppText(
                        model.product.name??"", size: 24.sp,
                        isBold: true,
                      ),
                      16.sp.sbH,
                      AppText(
                        model.product.description??"",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 15.sp),
                      ),
                      16.sp.sbH,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          AppText(
                            LocaleData.category.convertString()
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              height: 40.sp,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: model.product.categories?.length,
                                itemBuilder: (_, i){
                                  return Column(
                                    children: [
                                      AppCard(
                                        margin: 10.sp.padR,
                                        padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 9.sp),
                                        expandable: true,
                                        child: AppText(
                                            model.product.categories?[i].name??""
                                        ),
                                      ),
                                    ],
                                  );
                                }
                              ),
                            ),
                          ),
                        ],
                      ),
                      10.sp.sbH,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          AppText(
                              LocaleData.price.convertString()
                          ),
                          AppText(
                            "NGN ${model.prices?.nGN?[0]}"
                          ),
                        ],
                      ),
                    ],
                  )
                ),
              ],
            ),
            SizedBox(
              height: 120.sp,
              child: AppBars(
                systemOverlayStyle: theme.isDark? SystemUiOverlayStyle.dark: null,
              ),
            )
          ],
        ),
      ),
    );
  }
}
