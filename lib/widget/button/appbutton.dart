import 'dart:io';

import 'package:flutter/material.dart';

class AppButton {
  Widget buttonRoute(BuildContext context, String text,
      {Image? image, Color? color, String? route}) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: color),
      onPressed: () {
        route != null
            ? Navigator.pushNamed(context, route)
            : stderr.writeln("");
      },
      child: Container(
          width: MediaQuery.of(context).size.width - 100,
          padding: const EdgeInsets.all(10),
          child: Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              image!,
              const SizedBox(
                width: 5,
              ),
              Text(
                text,
                style: const TextStyle(color: Colors.white, fontSize: 18),
              )
            ],
          ))),
    );
  }

  Widget btnSubmit(BuildContext context, String text, Function() func) {
    return ElevatedButton(
        style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.blue)),
        onPressed: () {
          func();
        },
        child: Container(
            width: MediaQuery.of(context).size.width - 80,
            padding: const EdgeInsets.all(10),
            child: Center(
              child: Text(
                text,
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
            )));
  }
}
