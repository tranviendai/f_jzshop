import 'package:f_jzshop/app/config/reponsive.dart';
import 'package:f_jzshop/app/model/product_model.dart';
import 'package:f_jzshop/widget/layout/home/list_product.dart';
import 'package:flutter/material.dart';

class ProductSearchScreen extends StatefulWidget {
  final List<ProductModel> products;
  final String? category;
  const ProductSearchScreen(
      {super.key, required this.products, required this.category});

  @override
  State<ProductSearchScreen> createState() => _ProductSearchScreenState();
}

class _ProductSearchScreenState extends State<ProductSearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
        title: Text(widget.category!,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(
                    context: context, delegate: MySearch(widget.products));
              },
              icon: const Icon(Icons.search,color: Colors.white))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Responsive(
            desktop: Column(
              children: [
                productList(widget.products, 5,
                    MediaQuery.of(context).size.width / 2100, 150)
              ],
            ),
            tablet: Column(
              children: [
                productList(widget.products, 4,
                    MediaQuery.of(context).size.width / 1450, 40)
              ],
            ),
            mobile: Column(children: [
              productList(widget.products, 3,
                  MediaQuery.of(context).size.width / 850, 20),
            ]),
          ),
        ]),
      ),
    );
  }
}

class MySearch extends SearchDelegate {
  List<ProductModel> products;
  MySearch(this.products);
  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
            onPressed: () {
              if (query.isEmpty) {
                close(context, null); //close
              } else {
                query = '';
              }
            },
            icon: const Icon(Icons.clear))
      ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back));

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text(query, style: const TextStyle(fontSize: 64)),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<ProductModel> tempProducts = products.where((e) {
      final res = e.name!.toLowerCase();
      final input = query.toLowerCase();
      return res.contains(input);
    }).toList();
    return SingleChildScrollView(
      child: Responsive(
        desktop: Column(
          children: [
            productList(
                tempProducts, 5, MediaQuery.of(context).size.width / 2100, 150)
          ],
        ),
        tablet: Column(
          children: [
            productList(
                tempProducts, 4, MediaQuery.of(context).size.width / 1450, 40)
          ],
        ),
        mobile: Column(children: [
          productList(
              tempProducts, 3, MediaQuery.of(context).size.width / 850, 20),
        ]),
      ),
    );
  }
}
