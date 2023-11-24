import 'package:f_jzshop/app/constants/image_contant.dart';
import 'package:f_jzshop/app/data/bloc/auth/AuthCubit.dart';
import 'package:f_jzshop/app/data/repository/repository.dart';
import 'package:f_jzshop/widget/button/appbutton.dart';
import 'package:f_jzshop/widget/dialog/textfiled_validate.dart';
import 'package:f_jzshop/widget/text_input/textfield.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  final double vertical;
  final double horizontal;
  final String text;
  const LoginForm(
      {super.key,
      required this.vertical,
      required this.horizontal,
      required this.text});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  String token = "";
  bool _isCheck = true;
  void showPass() {
    setState(() {
      _isCheck = !_isCheck;
    });
  }
  void loginFunc() async {
    if(username.text == "" || password.text == ""){
      showError(context, "Please!, Input username or password");
    }else{
      APIRepository().login(context, username.text, password.text);
    token = AuthCubit.token;
    }
  }

  @override
  void dispose() {
    username.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment(0.8, 1),
            colors: <Color>[
              Color.fromARGB(255, 210, 215, 234),
              Color.fromARGB(255, 56, 135, 180),
              Color.fromARGB(255, 44, 108, 154),
              Color.fromARGB(255, 56, 135, 180),
            ],
            tileMode: TileMode.mirror,
          ),
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30), color: Colors.white30),
          margin: EdgeInsets.symmetric(
              vertical: widget.vertical, horizontal: widget.horizontal),
          padding: const EdgeInsets.all(25),
          child: Container(
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 35, 35, 35),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppText.textFiled(context, username, "UserName", Icons.person),
                AppText.textFiled(
                  context,
                  password,
                  obscure: _isCheck,
                  "Password",
                  Icons.lock,
                  showPass: (context) {
                    showPass();
                  },
                ),
                Container(
                  margin: const EdgeInsets.all(5),
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Forgot Password",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )),
                ),
                AppButton().btnSubmit(context, "Sign In", loginFunc),
                const SizedBox(height: 50),
                AppButton().buttonRoute(context, "Facebook",
                    color: const Color.fromARGB(255, 101, 101, 101),
                    image: Image.asset(AppImage.iconFB, height: 18)),
                const SizedBox(height: 10),
                AppButton().buttonRoute(context, "Google",
                    color: const Color.fromARGB(255, 101, 101, 101),
                    image: Image.asset(AppImage.iconGG, height: 18))
              ],
            ),
          ),
        ));
  }
}

