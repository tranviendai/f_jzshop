import 'package:flutter/material.dart';

 Future showError(BuildContext context, String text) => showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text(
                'Error',
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
              content: Text(text, style: const TextStyle(fontSize: 18, color: Colors.black),),
              actions: <Widget>[
                MaterialButton(
                  elevation: 5.0,
                  child: const Text("Ok"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });