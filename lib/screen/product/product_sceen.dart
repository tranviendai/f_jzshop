import 'package:f_jzshop/app/config/reponsive.dart';
import 'package:f_jzshop/app/model/product_model.dart';
import 'package:f_jzshop/widget/layout/product/detail_product.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  final ProductModel product;
  const ProductScreen({super.key, required this.product});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    var product = widget.product;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onPressed: () => Navigator.of(context).pop()),
        backgroundColor: Colors.blue,
        title: Text(product.name.toString(),
            style: const TextStyle(color: Colors.white)),
      ),
      body: Responsive(
        desktop: detailProduct(context, product, 20, 20, 400, false),
        tablet: detailProduct(context, product, 40, 0, 450, true),
        mobile: detailProduct(context, product, 15, 0, 400, true),
      ),
      bottomNavigationBar: BottomAppBar(
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              child: widget.product.isPublish!
                  ? Row(children: [
                      Expanded(
                        flex: 1,
                        child: IconButton(
                            onPressed: () { /*
                            => Navigator.pushNamed(context, "Cart")
                             */},
                            icon: const Icon(
                              Icons.shopping_cart_sharp,
                              color: Colors.blue
                            ),
                            style: ButtonStyle(
                              shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)))
                            )),
                      ),
                      Expanded(
                          flex: 5,
                          child: ElevatedButton(
                              onPressed: () {
                                /*
                                  => showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    enableDrag: true,
                                    isDismissible: true,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(15),
                                          topRight: Radius.circular(15)),
                                    ),
                                    builder: (context) => AddCartScreen(
                                          product: product,
                                          topping: toppings,
                                        ))
                                   */
                              },
                              style: ButtonStyle(
                                backgroundColor: const MaterialStatePropertyAll(Colors.blue),
                                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)
                                ))
                              ),
                              child: const Text("Add To Cart", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))))
                    ])
                  : Text("Notification",style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)))),
    );
  }
}