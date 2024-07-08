import 'package:flutter/material.dart';

import '../../locator.dart';
import '../../screens/main/cart/cart.ui.dart';
import '../../screens/main/home/detail-view/product.detail.ui.dart';
import '../services/local/cache.service.dart';
import 'routes.dart';

class Routers {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final cache = locator<AppCache>();
    switch (settings.name) {
      case ProductDetailRoute:
        return MaterialPageRoute(builder: (_) => const ProductDetailView());
      case CartViewRoute:
        return MaterialPageRoute(builder: (_) => const CartView());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
