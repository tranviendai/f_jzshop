import 'package:f_jzshop/app/config/reponsive.dart';
import 'package:f_jzshop/widget/layout/auth/login_form.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          actions: [
            InkWell(
                onTap: () {
                  Navigator.pushNamed(context, "SignUp");
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: const Center(
                      child: Text(
                    "SIGN UP?",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )),
                ))
          ],
        ),
        body: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Responsive(
              desktop: LoginForm(
                  vertical: 84.5,
                  horizontal: MediaQuery.of(context).size.width / 4,
                  text: "/"),
              tablet: LoginForm(
                  vertical: 84.5,
                  horizontal: MediaQuery.of(context).size.width / 8.6,
                  text: "/"),
              mobile: const LoginForm(vertical: 84.5, horizontal: 10, text: "/"),
            )));
  }
}