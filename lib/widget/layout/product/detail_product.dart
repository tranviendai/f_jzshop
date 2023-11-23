import 'package:f_jzshop/app/data/repository/api/api.dart';
import 'package:f_jzshop/app/model/product_model.dart';
import 'package:flutter/material.dart';

Widget detailProduct(BuildContext context, ProductModel product,
    double paddingHori, double paddingVerti, double height, bool imgWrap) {
  var totalPrice = product.price! - (product.price! * product.discount! / 100);
  return Container(
    padding:
        EdgeInsets.symmetric(horizontal: paddingHori, vertical: paddingVerti),
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            children: [
              imgWrap
                  ? Align(
                      alignment: Alignment.center,
                      child: Image.network(
                          "${API().baseUrl}/images/${product.image}",
                          height: height))
                  : Image.network("${API().baseUrl}/images/${product.image}",
                      height: height),
              SizedBox(
                width: !imgWrap
                    ? MediaQuery.of(context).size.width / 1.8
                    : MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                        text: TextSpan(children: [
                          product.discount != 0 ?  WidgetSpan(child: Container(
                        margin: const EdgeInsets.only(right: 5),
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(5)
                        ),
                        child: Text(
                         "-${product.discount}%",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.white)),
                      )) : TextSpan(),
                      TextSpan(
                          text: product.name.toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Colors.black)),
                    ])),
                    Row(children: [
                     product.discount != 0 ?  Text("\$${product.price} ",
                          style: const TextStyle(
                              color: Colors.black26,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.lineThrough,
                              fontSize: 30))
                       : SizedBox(),
                      Text("\$${totalPrice.toStringAsPrecision(4)}",
                          style: const TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 30))
                    ]),
                    Text("${product.description}")
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    ),
  );
}

