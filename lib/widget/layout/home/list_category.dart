import 'package:f_jzshop/app/data/bloc/category/category_state.dart';
import 'package:f_jzshop/app/data/bloc/category/category_cubit.dart';
import 'package:f_jzshop/app/data/repository/api/api.dart';
import 'package:f_jzshop/app/model/category_model.dart';
import 'package:f_jzshop/screen/product/product_filter_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget categoryList(
    List<CategoryModel> categories, double padding, double ratio) {
  return BlocBuilder<CategoryCubit, CategoryState>(builder: (context, state) {
    if (state is CategoryLoaded) {
      categories = state.categories;
    }
    return Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: padding),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, childAspectRatio: ratio),
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              var category = categories[index];
              return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProductSearchScreen(
                                  products: category.products!,
                                  category: category.name,
                                )));
                  },
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                          "${API().baseUrl}/images/${category.icon}",
                          height: 50,
                        ),
                        Text(category.name.toString())
                      ]));
            }));
  });
}
