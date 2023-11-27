import 'package:f_jzshop/screen/auth/login_screen.dart';
import 'package:f_jzshop/screen/cart/cart_screen.dart';
import 'package:f_jzshop/screen/home/home_sceen.dart';
import 'package:f_jzshop/screen/splash/splash_screen.dart';
import 'package:f_jzshop/widget/nav/navbar.dart';
import 'package:flutter/material.dart';

class AppRoute {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const MyNavbar());
      case 'Splash':
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case 'Home':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case 'Cart':
        return MaterialPageRoute(builder: (_) => const CartScreen());
      case 'SignIn':
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      default:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
    }
  }
}
