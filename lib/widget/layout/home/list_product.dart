import 'package:f_jzshop/app/data/bloc/product/product_cubit.dart';
import 'package:f_jzshop/app/data/bloc/product/product_state.dart';
import 'package:f_jzshop/app/data/repository/api/api.dart';
import 'package:f_jzshop/app/model/product_model.dart';
import 'package:f_jzshop/screen/product/product_sceen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget productList(List<ProductModel> products, int count, double ratio,double padding) {
  return Container(
    color: Colors.white,
    padding: EdgeInsets.symmetric(horizontal: padding),
    child: BlocBuilder<ProductCubit, ProductState>(builder: (context, state) {
      if (state is ProductLoaded) {
        products = state.products;
      }
      return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: count, childAspectRatio: ratio),
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: products.length,
        itemBuilder: (context, index) {
          var product = products[index];
          var totalPrice = product.price! - (product.discount!/100 * product.price!);
          return Container(
              margin: const EdgeInsets.all(5),
              padding:const EdgeInsets.only(bottom: 5),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black38, width: 0.5)),
            child: InkWell(
              onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductScreen(product: product))),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                   product.discount != 0?  Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: const BoxDecoration(color: Colors.red),
                            child: Text(
                              "${product.discount}%",
                              style: TextStyle(color: Colors.white),
                            ))) : Container(),
                   Image.network(
                            "${API().baseUrl}/images/${product.image}"),
                    Positioned(
                        left: 5,
                        right: 5,
                        bottom: 20,
                        child: Text(
                          product.name.toString(),
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        )),
                    Positioned(
                        left: 5,
                        right: 5,
                        bottom: 0,
                        child: Text("\$${totalPrice.toStringAsPrecision(4)}",
                            style: const TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 18)))
                  ],
                ),
              ),
          );
        },
      );
    }),
  );
}
