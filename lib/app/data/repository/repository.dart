import 'package:f_jzshop/app/data/repository/api/api.dart';
import 'package:f_jzshop/app/model/category_model.dart';
import 'package:f_jzshop/app/model/product_model.dart';
import 'package:dio/dio.dart';

class APIRepository{
  API api = API();
  var header = {
    "Access-Control-Allow-Origin": "*",
    'Content-Type': 'application/json',
    'Accept': '*/*',
  };
  Future<List<ProductModel>> fetchListProduct() async {
    try {
      Response res = await api.sendRequest.get('/Products', options: Options(headers: header));
      List<dynamic> productMaps = res.data;
      return productMaps.map((e) => ProductModel.fromListJson(e)).toList();
    } catch (ex) {
      rethrow;
    }
  }
  Future<List<CategoryModel>> fetchListCategory() async {
    try {
      Response res = await api.sendRequest.get('/categories', options: Options(headers: header));
      List<dynamic> categoryMaps = res.data;
      return categoryMaps.map((e) => CategoryModel.fromJson(e)).toList();
    } catch (ex) {
      rethrow;
    }
  }
}