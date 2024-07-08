import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../model/default.model.dart';
import '../../model/get-product-response.dart';
import 'base.api.service.dart';

class ShopService {


  Future<Either<ResModel, GetProductResponse>> getProducts() async {
    try {
      Response response = await connect().get("products");
      print(GetProductResponse.fromJson(jsonDecode(response.data)).size);
      return Right(GetProductResponse.fromJson(jsonDecode(response.data)));
    } on DioError catch (e) {
      print(e.response.toString());
      return Left(resModelFromJson(e.response?.data));
    } catch (e) {
      print(e.toString());
      return Left(ResModel(message: e.toString()));
    }
  }

  Future<Either<ResModel, Items>> getProduct({
    required String productID
  }) async {
    try {
      Response response = await connect().get("products/$productID");
      return Right(Items.fromJson(jsonDecode(response.data)));
    } on DioError catch (e) {
      return Left(resModelFromJson(e.response?.data));
    } catch (e) {
      return Left(ResModel(message: e.toString()));
    }
  }



}