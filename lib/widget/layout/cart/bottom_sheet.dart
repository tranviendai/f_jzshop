import 'package:f_jzshop/app/data/bloc/cart/cart_cubit.dart';
import 'package:f_jzshop/app/data/bloc/topping/topping_cubit.dart';
import 'package:f_jzshop/app/data/bloc/topping/topping_state.dart';
import 'package:f_jzshop/app/data/repository/api/api.dart';
import 'package:f_jzshop/app/model/product_model.dart';
import 'package:f_jzshop/app/model/topping_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomSheetCart extends StatefulWidget {
  final ProductModel product;
  final List<ToppingModel> topping;
  const BottomSheetCart(
      {super.key, required this.product, required this.topping});

  @override
  State<BottomSheetCart> createState() => _BottomSheetCartState();
}

enum SizeList { S, M, L }

class _BottomSheetCartState extends State<BottomSheetCart> {
  SizeList? _size = SizeList.S;
  double totalPrice = 0;
  double totalTopping = 0;
  List<ToppingModel> tempTopping = [];
  List<ToppingModel> listTopping = [];
  int count = 1;

  @override
  void initState() {
    super.initState();
    totalPrice = widget.product.price! -
        (widget.product.discount! / 100 * widget.product.price!);
    tempTopping = widget.topping;
  }

  void itemCountPlus() {
    if (count > 11) count = 11;
    setState(() {
      count++;
    });
  }

  void itemCountMinus() {
    if (count < 2) count = 2;
    setState(() {
      count--;
    });
  }

  void onChangeSelect(dynamic value, double price) {
    setState(() {
      _size = value;
      totalPrice = price;
    });
  }
  
  @override
  void dispose() {
    super.dispose();
   
  }

  @override
  Widget build(BuildContext context) {
    double price = widget.product.price! -
        (widget.product.discount! / 100 * widget.product.price!);
    double typeS = price;
    double typeM = price + (price * 0.2);
    double typeL = price + (price * 0.4);
    return Container(
        height: MediaQuery.of(context).size.height / 1.1,
        margin: const EdgeInsets.all(20),
        child: Stack(
          children: [
            Positioned(
                right: -10,
                top: -10,
                child: IconButton(
                    onPressed: ()  {
                       Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.close,
                      size: 32,
                    ))),
            Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    maxLines: 1,
                    softWrap: true,
                    text: TextSpan(
                      children: [
                        WidgetSpan(child: Image.network(
                        "${API().baseUrl}/images/${widget.product.image!}",
                        height: 20)),
                        TextSpan(text:widget.product.name!,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold,color: Colors.black))
                      ]
                    )),
                  textAlignLeft(const Text("Select Size:",
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold))),
                  RadioListTile(
                      title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                           const Text('Size S', 
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                            Text("\$${typeS.toStringAsPrecision(3)}",
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold))
                          ]),
                      value: SizeList.S,
                      groupValue: _size,
                      activeColor: Colors.blue,
                      onChanged: (value) => onChangeSelect(value, typeS)),
                  RadioListTile(
                      title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                           const Text('Size M',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                            Text("\$${typeM.toStringAsPrecision(3)}",
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold))
                          ]),
                      value: SizeList.M,
                      groupValue: _size,
                      activeColor: Colors.blue,
                      onChanged: (value) => onChangeSelect(value, typeM)),
                  RadioListTile(
                      title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                           const  Text('Size L',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                            Text("\$${typeL.toStringAsPrecision(3)}",
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold))
                          ]),
                      value: SizeList.L,
                      activeColor: Colors.blue,
                      groupValue: _size,
                      onChanged: (value) => onChangeSelect(value, typeL)),
                  Column(children: [
                    textAlignLeft(Text(
                        "Select Topping (Maximum: ${tempTopping.length}):",
                        style:const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold))),
                    Container(
                        height: MediaQuery.of(context).size.height / 2.9,
                        padding: const EdgeInsets.all(10),
                        child: BlocBuilder<ToppingCubit, ToppingState>(
                            builder: (context, static) {
                          if (static is ToppingLoaded) {
                            tempTopping = static.topping!;
                          }
                          return ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              itemCount: tempTopping.length,
                              itemBuilder: (context, index) {
                                var topping = tempTopping[index];
                                return Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(children: [
                                        Checkbox(
                                           activeColor: Colors.blue,
                                           checkColor: Colors.white,
                                            value: topping.isCheck,
                                            onChanged: (value) {
                                              setState(() {
                                                topping.isCheck = value;
                                                if (topping.isCheck!) {
                                                  totalTopping += topping.price!;
                                                  listTopping.add(topping);
                                                } else {
                                                  totalTopping -=
                                                      topping.price!;
                                                  listTopping.remove(topping);
                                                }
                                              });
                                            }),
                                        Container(
                                            margin:
                                                const EdgeInsets.only(left: 12),
                                            child: Text(
                                              topping.name!,
                                              style: const  TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ))
                                      ]),
                                      Container(
                                        margin: const EdgeInsets.only(right: 8),
                                        child:  Text("\$${topping.price!}",
                                            style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold)),
                                      )
                                    ]);
                              });
                        }))
                  ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            flex: 1,
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  IconButton(
                                    onPressed: itemCountMinus,
                                    icon: const Icon(Icons.remove),
                                    color: Colors.white,
                                    style: const ButtonStyle(
                                      backgroundColor:
                                           MaterialStatePropertyAll(
                                              Colors.blue),
                                    ),
                                  ),
                                  Text("$count"),
                                  IconButton(
                                    onPressed: itemCountPlus,
                                    icon: const Icon(Icons.add),
                                    color: Colors.white,
                                    style: const ButtonStyle(
                                      backgroundColor:
                                           MaterialStatePropertyAll(
                                              Colors.blue),
                                    ),
                                  )
                                ])),
                        Expanded(
                            flex: 2,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        const MaterialStatePropertyAll(
                                            Colors.blue),
                                    shape: MaterialStatePropertyAll(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5)))),
                                child: Text(
                                  "Add ${((totalPrice * count) + (totalTopping * count)).toStringAsPrecision(3)}",
                                  style: const TextStyle(color: Colors.white),
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                  context
                                      .read<CartCubit>()
                                      .addToCart(ProductModel(
                                          id: widget.product.id,
                                          name: widget.product.name,
                                          price: _size!.index == 0
                                              ? typeS
                                              : _size!.index == 1
                                                  ? typeM
                                                  : typeL,
                                          description: "",
                                          discount: widget.product.discount,
                                          image: widget.product.image,
                                          isPublish: true,
                                          postDate: widget.product.postDate,
                                          size: _size!.index == 0
                                              ? "S"
                                              : _size!.index == 1
                                                  ? "M"
                                                  : "L",
                                          quantity: count,
                                          topping: listTopping));
                                }))
                      ])
                ]),
          ],
        ));
  }
}

Widget textAlignLeft(Widget text) {
  return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
      child: text);
}
