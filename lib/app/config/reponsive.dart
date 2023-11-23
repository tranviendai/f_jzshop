import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget? mobile;
  final Widget? tablet;
  final Widget? desktop;
  const Responsive({super.key, this.mobile, this.tablet, this.desktop});

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 500;
  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1100;
  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width > 1099;

  @override
  Widget build(BuildContext context) {
     return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 600) {
        return mobile!;
      } else if (constraints.maxWidth < 1100) {
        return tablet!;
      } else {
        return desktop!;
      }
    });
  }
}