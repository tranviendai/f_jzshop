import 'package:f_jzshop/app/data/bloc/cart/cart_cubit.dart';
import 'package:f_jzshop/app/data/repository/api/api.dart';
import 'package:f_jzshop/app/model/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  double setHeight(int lenght) {
    double height = 0;
    for (int i = 0; i < lenght; i++) {
      height = 32.0 * lenght;
    }
    return height;
  }

  @override
  Widget build(BuildContext context) {
    double heightTopping = 0;
    return BlocBuilder<CartCubit, CartModel>(builder: (context, state) {
      return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ),
            title: const Text("Cart",
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
            actions: [
              state.products!.isNotEmpty
                  ? Container(
                      margin: const EdgeInsets.only(right: 20),
                      alignment: Alignment.center,
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: "Total: ",
                              style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)
                                  .copyWith(fontWeight: FontWeight.bold)),
                          TextSpan(
                              text:
                                  "\$${state.totalPrice.toStringAsPrecision(3)}",
                              style: const TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white))
                        ]),
                      ))
                  : Container()
            ],
          ),
          body: state.products!.isNotEmpty
              ? SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                        child: ListView.builder(
                          itemCount: state.products!.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            var product = state.products![index];
                            heightTopping = setHeight(product.topping!.length);
                            return Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(width: 1, color: Colors.black12),
                                  color: Colors.white),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Image.network(
                                        "${API().baseUrl}/images/${product.image!}",
                                        height: 100,
                                      ),
                                      Expanded(
                                        child: Wrap(
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.symmetric(
                                                  vertical: 5),
                                              child: Text(
                                                "${product.name!} (${product.size!})",
                                                style: const TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  "\$${(product.price!).toStringAsPrecision(3)}",
                                                  style: const TextStyle(
                                                          fontSize: 20,
                                                          fontWeight: FontWeight.bold)
                                                      .copyWith(color: Colors.red),
                                                ),
                                                Row(
                                                  children: [
                                                    product.quantity != 1
                                                        ? IconButton(
                                                            onPressed: () {
                                                              setState(() {
                                                                product.quantity =
                                                                    product.quantity! -
                                                                        1;
                                                              });
                                                            },
                                                            icon: Icon(Icons.remove))
                                                        : IconButton(
                                                            onPressed: () {
                                                              context
                                                                  .read<CartCubit>()
                                                                  .removeToCart(
                                                                      product);
                                                            },
                                                            icon: const Icon(Icons
                                                                .delete_outlined)),
                                                    Container(
                                                        padding: EdgeInsets.all(5),
                                                        child: Text(
                                                            "${product.quantity}")),
                                                    IconButton(
                                                        onPressed: () {
                                                          setState(() {
                                                            product.quantity =
                                                                product.quantity! + 1;
                                                          });
                                                        },
                                                        icon: const Icon(Icons.add))
                                                  ],
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  product.topping!.isNotEmpty
                                      ? Container(
                                          margin: const EdgeInsets.all(4),
                                          height: heightTopping,
                                          child: ListView.builder(
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            scrollDirection: Axis.vertical,
                                            itemCount: product.topping!.length,
                                            itemBuilder: (context, index) {
                                              var topping = product.topping![index];
                                              return Container(
                                                margin: const EdgeInsets.symmetric(
                                                    horizontal: 20, vertical: 5),
                                                child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(topping.name!,
                                                          style: const TextStyle(
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight.bold)),
                                                      Text("\$${topping.price!}",
                                                          style: const TextStyle(
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight.bold))
                                                    ]),
                                              );
                                            },
                                          ),
                                        )
                                      : SizedBox(
                                          height: 40,
                                          child: Container(
                                              margin: const EdgeInsets.all(5),
                                              child: const Text(
                                                "No extras dishes...",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold),
                                                maxLines: 1,
                                              )),
                                        )
                                ],
                              ),
                            );
                          },
                        )),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(10),
                    child: ElevatedButton(onPressed: (){}, 
                    style: ButtonStyle(
                        backgroundColor:
                                          const MaterialStatePropertyAll(
                                              Colors.blue),
                                      shape: MaterialStatePropertyAll(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5)))
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      child: const Text("Payment",style: TextStyle(color: Colors.white,fontSize:20),))),
                  ),
                 const SizedBox(height: 20)
                  ],
                ),
              )
              : const Center(
                  child: Text("No cart empty..."),
                ));
    });
  }
}
