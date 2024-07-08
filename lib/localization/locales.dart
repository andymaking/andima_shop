import 'package:flutter_localization/flutter_localization.dart';

const List<MapLocale> LOCALES =[
  MapLocale("en", LocaleData.EN),
];

mixin LocaleData {

  static const String emptyPhoneNumber = 'emptyPhoneNumber';
  static const String invalidPhoneNumber = 'invalidPhoneNumber';
  static const String password8 = 'password8';
  static const String home = 'home';
  static const String searchProduct = 'searchProduct';
  static const String productCover = 'productCover';
  static const String cart = 'cart';
  static const String category = 'category';
  static const String passwordNumber = 'passwordNumber';
  static const String passwordCapital = 'passwordCapital';
  static const String continues = 'continues';
  static const String passwordSmall = 'passwordSmall';
  static const String passwordSign = 'passwordSign';
  static const String enterPassword = 'enterPassword';
  static const String emptyField = 'emptyField';
  static const String confirmPassword = 'confirmPassword';
  static const String andima = 'andima';
  static const String price = 'price';
  static const String shop = 'shop';
  static const String confirmPasswordSamePassword = 'confirmPasswordSamePassword';


  static const Map<String, dynamic> EN = {
    emptyPhoneNumber: "Phone Number cannot be empty",
    andima: "Andima",
    price: "Price:  ",
    category: "Category:  ",
    shop: "Shop",
    productCover: "https://via.placeholder.com/130x88",
    continues: "Continue",
    home: "Home",
    searchProduct: "Search Product",
    cart: "Cart",
    password8: "8 characters minimum",
    enterPassword: "Enter Password",
    confirmPassword: "Confirm Password",
    passwordNumber: "A number",
    passwordCapital: "CAPITAL letter",
    passwordSmall: "small letter",
    emptyField: "Field Cannot be empty",
    confirmPasswordSamePassword: "Confirm password Must be equal to password",
    passwordSign: "Password must contain signs (\$-@!*)",
    invalidPhoneNumber: "Invalid Phone Number",



  };

}