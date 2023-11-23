import 'dart:ui';
import 'package:f_jzshop/app/data/bloc/cart/cart_cubit.dart';
import 'package:f_jzshop/app/data/bloc/category/category_cubit.dart';
import 'package:f_jzshop/app/data/bloc/product/product_cubit.dart';
import 'package:f_jzshop/app/data/bloc/topping/topping_cubit.dart';
import 'package:f_jzshop/routes/app_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => CategoryCubit()),
          BlocProvider(create: (context) => ProductCubit()),
          BlocProvider(create: (context) => CartCubit()),
          BlocProvider(create: (context) => ToppingCubit())
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            scrollBehavior: const MaterialScrollBehavior().copyWith(
              dragDevices: {
                PointerDeviceKind.mouse,
                PointerDeviceKind.touch,
                PointerDeviceKind.stylus,
                PointerDeviceKind.unknown
              },
            ),
            initialRoute: "/",
            onGenerateRoute: AppRoute.onGenerateRoute));
  }
}
