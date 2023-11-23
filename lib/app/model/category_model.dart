
import 'package:f_jzshop/app/model/product_model.dart';

class CategoryModel {
    String? id;
    String? name;
    String? icon;
    List<ProductModel>? products;

    CategoryModel({
        this.id,
        this.name,
        this.icon,
        this.products,
    });

    factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json["id"],
        name: json["name"],
        icon: json["icon"],
        products: json["products"] == null ? [] : List<ProductModel>.from(json["products"]!.map((x) => ProductModel.fromListJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "icon": icon,
        "products": products == null ? [] : List<dynamic>.from(products!.map((x) => x.toJson())),
    };
}
