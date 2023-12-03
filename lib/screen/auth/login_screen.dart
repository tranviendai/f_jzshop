import 'package:f_jzshop/app/config/reponsive.dart';
import 'package:f_jzshop/widget/layout/auth/signup_form.dart';
import 'package:f_jzshop/widget/layout/auth/login_form.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
    bool isLogin = false;

  void onChangeView(){
    setState(() {
                  isLogin = !isLogin;
                });
  }
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
                onTap:onChangeView,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child:  Center(
                      child: Text(
                    isLogin ? "SIGN UP?" : "SIGN IN?",
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )),
                ))
          ],
        ),
        body: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: isLogin != true ? Responsive(
              desktop: SignUpForm(
                  vertical: 84.5,
                  horizontal: MediaQuery.of(context).size.width / 4,
                  text: "/"),
              tablet: SignUpForm(
                  vertical: 84.5,
                  horizontal: MediaQuery.of(context).size.width / 8.6,
                  text: "/"),
              mobile: const SignUpForm(vertical: 79.5, horizontal: 10, text: "/"),
            ) : Responsive(
              desktop: LoginForm(
                  vertical: 84.5,
                  horizontal: MediaQuery.of(context).size.width / 4,
                  text: "/"),
              tablet: LoginForm(
                  vertical: 84.5,
                  horizontal: MediaQuery.of(context).size.width / 8.6,
                  text: "/"),
              mobile: const LoginForm(vertical: 79.5, horizontal: 10, text: "/"),
            )));
  }
}