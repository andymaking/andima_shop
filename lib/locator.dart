import 'package:get_it/get_it.dart';

import '../data/repository/repository.service.dart';
import '../data/services/local/cache.service.dart';
import '../data/services/local/locale.service.dart';
import '../data/services/local/navigation.service.dart';
import '../data/services/local/storage.service.dart';
import '../data/services/local/theme.service.dart';
import '../data/services/web/shop.service.dart';
import 'screens/base-vm.dart';
import 'screens/main/home/detail-view/product.detail.vm.dart';
import 'screens/main/home/home.vm.dart';


GetIt locator = GetIt.I;

setupLocator() {
  registerViewModel();
  setUpServices();
}

setUpServices(){
  locator.registerLazySingleton<NavigationService>(() => NavigationService());
  locator.registerLazySingleton<StorageService>(() => StorageService());
  locator.registerLazySingleton<Repository>(() => Repository());
  locator.registerLazySingleton<AppCache>(() => AppCache());
  locator.registerLazySingleton<ThemeModel>(() => ThemeModel());
  locator.registerLazySingleton<LocaleService>(() => LocaleService());
  locator.registerLazySingleton<ShopService>(() => ShopService());
}

registerViewModel(){
  /* TODO Setup viewModels*/
  locator.registerFactory<BaseViewModel>(() => BaseViewModel());
  locator.registerFactory<HomeViewModel>(() => HomeViewModel());
  locator.registerFactory<ProductDetailViewModel>(() => ProductDetailViewModel());
  // locator.registerFactory<ForgotPasswordViewModel>(() => ForgotPasswordViewModel());
  // locator.registerFactory<ProfileEditViewModel>(() => ProfileEditViewModel());
  // locator.registerFactory<ProfileHomeViewModel>(() => ProfileHomeViewModel());
  // locator.registerFactory<SettingsViewModel>(() => SettingsViewModel());
}