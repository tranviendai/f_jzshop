import 'dart:async';

import 'package:f_jzshop/app/constants/image_contant.dart';
import 'package:f_jzshop/app/data/bloc/auth/AuthCubit.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    setState(() {
      Timer(const Duration(seconds: 2), () { 
        Navigator.pushNamed(context, AuthCubit.token == "" ? "SignIn" : "/");
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AppImage.logo, height: 200,),
                Container(
                  padding: const EdgeInsets.all(5),
                  child: const Text("WELCOME TO JZENOAPP",
                style: TextStyle(color: Colors.white, fontSize: 30,fontWeight: FontWeight.bold)),),
                const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                )
              ],
            ),
      ),
    );
  }
}