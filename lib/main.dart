import 'dart:ui';

import 'package:f_jzshop/app/config/reponsive.dart';
import 'package:f_jzshop/app/data/bloc/category/category_cubit.dart';
import 'package:f_jzshop/app/data/bloc/product/product_cubit.dart';
import 'package:f_jzshop/screen/home/home_sceen.dart';
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
          BlocProvider(create: (context) => ProductCubit())
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
            home: Responsive(
              desktop: navBar(),
              tablet: navBar(),
              mobile: Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.blue,
                  title: const Text(
                    "JZENO",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  centerTitle: true,
                  actions: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                        ))
                  ],
                ),
                body: const HomeScreen(),
                bottomNavigationBar: BottomNavigationBar(
                  items: const [
                    BottomNavigationBarItem(
                        icon: Icon(Icons.home), label: "Home"),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.person), label: "Person")
                  ],
                ),
              ),
            )));
  }
}

Widget navBar() {
  return Scaffold(
    backgroundColor: Colors.white,
    appBar: AppBar(
      backgroundColor: Colors.blue,
      title: Row(
        children: [
          const Text("JZeno",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          const SizedBox(width: 10),
          itemNav("Home", Icons.home)
        ],
      ),
      actions: [
        itemNav("Cart", Icons.shopping_cart),
        itemNav("Profile", Icons.person)
      ],
    ),
    body: const HomeScreen(),
  );
}

Widget itemNav(String text, IconData icon) {
  return InkWell(
      onTap: () {},
      child: Container(
          padding: const EdgeInsets.all(15),
          child: Center(
              child: Row(children: [
            Icon(icon, color: Colors.white),
            const SizedBox(width: 5),
            Text(text.toString(),
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18))
          ]))));
}
