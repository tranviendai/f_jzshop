import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppText{
  static Widget textFiled(BuildContext context,
      TextEditingController controller, String text, IconData icon,
      {TextCapitalization? format,
      bool? obscure,
      Function(BuildContext context)? showPass}) {
    return Container(
      padding: const EdgeInsets.only(top: 6, bottom: 6),
      child: TextFormField(
         validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
        maxLines: text == "Description" ? null : 1,
        style: TextStyle(color: Theme.of(context).hintColor),
        inputFormatters: [
          text == "Discount" || text == "Price"
              ? FilteringTextInputFormatter.digitsOnly
              : FilteringTextInputFormatter.singleLineFormatter
        ],
        controller: controller,
        obscureText: text == "Password" ? obscure! : false,
        decoration: InputDecoration(
            suffixIcon: text == "Password"
                ? IconButton(
                    icon: Icon(
                        obscure! ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      showPass!(context);
                    },
                  )
                : null,
            fillColor: Colors.white,
            filled: true,
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 1),
                borderRadius: BorderRadius.circular(10)),
            enabledBorder: const OutlineInputBorder(borderSide: BorderSide.none),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            hintText: text,
            hintStyle: TextStyle(color: Theme.of(context).hintColor),
            prefixIcon: Icon(icon, color: Theme.of(context).hintColor)),
      ),
    );
  }
}