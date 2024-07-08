import 'package:andima_shop/utils/string-extensions.dart';
import 'package:andima_shop/utils/widget_extensions.dart';
import 'package:flutter/material.dart';

import '../../../localization/locales.dart';
import '../../../widget/app-bar.dart';
import '../../base-ui.dart';
import 'cart.vm.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<CartViewModel>(
      builder: (_, model, theme, child)=> Scaffold(
        appBar: AppBars(
          text: LocaleData.cart.convertString(),
        ),
        body: Column(),
      ),
    );
  }
}
