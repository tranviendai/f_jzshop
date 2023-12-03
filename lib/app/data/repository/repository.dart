import 'package:f_jzshop/app/data/bloc/auth/AuthCubit.dart';
import 'package:f_jzshop/app/data/repository/api/api.dart';
import 'package:f_jzshop/app/model/category_model.dart';
import 'package:f_jzshop/app/model/product_model.dart';
import 'package:dio/dio.dart';
import 'package:f_jzshop/app/model/topping_model.dart';
import 'package:f_jzshop/app/model/user_model.dart';
import 'package:f_jzshop/widget/dialog/textfiled_validate.dart';
import 'package:flutter/material.dart';

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
  Future<List<ToppingModel>> fetchListTopping() async {
    try {
      Response res = await api.sendRequest
          .get('/toppings', options: Options(headers: header));
      List<dynamic> toppingMaps = res.data;
      return toppingMaps.map((e) => ToppingModel.fromJson(e)).toList();
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
  Future<String> login(BuildContext context,String username, String password) async {
    try {
      final body = {'username': username, 'passwordHash': password};
      Response res = await api.sendRequest
          .post('/Auth/login', options: Options(headers: header), data: body);
      if (res.statusCode == 200) {
        final tokenData = res.data;
        AuthCubit.token = tokenData;
        // ignore: use_build_context_synchronously
        Navigator.pushNamed(context,"/");
        return tokenData;
      } else {
        return "login error";
      }
    } catch (ex) {
      // ignore: use_build_context_synchronously
      showError(context, "We couldn't find an account that matches what you entered, but we've found one that closely matches.");
      rethrow;
    }
  }
   Future<String> register(BuildContext context,String username, String password,String fullname) async {
    try {
      final body = {'userName': username, 'password': password, 'fullName': fullname};
      Response res = await api.sendRequest
          .post('/Auth/register', options: Options(headers: header), data: body);
      if (res.statusCode == 200) {
       return login(context, username, password);
      } else {
        return "register error";
      }
    } catch (ex) {
      // ignore: use_build_context_synchronously
      showError(context, "Account already exists");
      rethrow;
    }
  }
  Future<String> logOut() async {
     return  AuthCubit.token = "";
  }
  Future<UserModel> getUser() async {
    try {
      Response res = await api.sendRequest.get('/Auth/current',
          options: Options(headers: {
            "Access-Control-Allow-Origin": "*",
            'Content-Type': 'application/json',
            'Accept': '*/*',
            'Authorization': 'Bearer ${AuthCubit.token}'
          }));
        return UserModel.fromJson(res.data);
    } catch (ex) {
      rethrow;
    }
  }

}