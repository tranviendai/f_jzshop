import 'package:f_jzshop/app/config/reponsive.dart';
import 'package:f_jzshop/app/data/bloc/product/product_cubit.dart';
import 'package:f_jzshop/app/data/bloc/product/product_state.dart';
import 'package:f_jzshop/app/model/category_model.dart';
import 'package:f_jzshop/app/model/product_model.dart';
import 'package:f_jzshop/screen/product/product_filter_screen.dart';
import 'package:f_jzshop/widget/layout/home/list_category.dart';
import 'package:f_jzshop/widget/layout/home/list_product.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ProductModel> products = [];
  List<CategoryModel> categories = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(builder: (context, state) {
      if (state is ProductLoaded) {
        products = state.products;
        return Center(
        child: SingleChildScrollView(
            child: Column(children: [
          Responsive(
              desktop: Column(
                children: [
                  carousel(300, 160),
                  categoryList(categories, 250, 2),
                  seeAll(context, products, 150),
                  productList(products, 5,
                      MediaQuery.of(context).size.width / 2100, 150)
                ],
              ),
              tablet: Column(
                children: [
                  carousel(300, 50),
                  categoryList(categories, 90, 1.5),
                  seeAll(context, products, 40),
                  productList(
                      products, 4, MediaQuery.of(context).size.width / 1450, 40)
                ],
              ),
              mobile: Column(children: [
                carousel(200, 10),
                categoryList(categories, 0, 1.2),
                seeAll(context, products, 20),
                productList(
                    products, 3, MediaQuery.of(context).size.width / 850, 20)
              ]))
        ])),
      );
      }
      else{
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }
    });
  }
}

Widget carousel(double heightImg, double padding) {
  final List<String> imgList = [
    'https://static-images.vnncdn.net/files/publish/2022/8/18/nguoi-viet-chi-gan-8500-ty-dong-mua-tra-sua-a381a2c6914b474e892483ea3b76ba84.jpg',
    'https://vcdn-suckhoe.vnecdn.net/2023/04/06/arrangement-with-delicious-tra-8618-3541-1680794870.jpg',
    'https://cdn.tgdd.vn/Files/2022/01/21/1412109/huong-dan-cach-lam-tra-sua-tran-chau-duong-den-202201211522033706.jpg',
  ];
  return Container(
    padding: EdgeInsets.symmetric(horizontal: padding),
    child: CarouselSlider.builder(
        itemCount: imgList.length,
        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
            SizedBox(
              child: Image.network(
                imgList[itemIndex],
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
            ),
        options: CarouselOptions(
            height: heightImg,
            aspectRatio: 16 / 9,
            viewportFraction: 0.8,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enlargeFactor: 0.3,
            scrollDirection: Axis.horizontal)),
  );
}

Widget seeAll(
    BuildContext context, List<ProductModel> products, double margin) {
  return Container(
    padding: EdgeInsets.only(right: margin, left: margin, top: 20, bottom: 5),
    alignment: Alignment.centerRight,
    child: TextButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProductSearchScreen(
                        products: products,
                        category: "All Product",
                      )));
        },
        style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.blue),
            padding: MaterialStatePropertyAll(
                EdgeInsets.symmetric(horizontal: 20, vertical: 10))),
        child: const Text("See all",
            style: TextStyle(color: Colors.white, fontSize: 15))),
  );
}
