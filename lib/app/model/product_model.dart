import 'package:f_jzshop/app/model/topping_model.dart';

class ProductModel {
  int? id;
  String? name;
  double? price;
  int? discount;
  String? image;
  String? description;
  String? postDate;
  bool? isPublish;
  String? size;
  int? quantity;
  String? categoryID;
  List<ToppingModel>? topping;

  ProductModel(
      {this.id,
      this.name,
      this.price,
      this.discount,
      this.image,
      this.description,
      this.postDate,
      this.isPublish,
      this.size,
      this.quantity,
      this.topping,
      this.categoryID});

  factory ProductModel.fromListJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        name: json["name"],
        price: json["price"]?.toDouble(),
        discount: json["discount"],
        image: json["image"],
        description: json["description"],
        postDate: json["postDate"],
        isPublish: json["isPublish"],
        categoryID: json["categoryID"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "discount": discount,
        "image": image,
        "description": description,
        "postDate": postDate,
        "isPublish": isPublish,
        "categoryID": categoryID
      };
  double get totalPrice =>
      topping!.fold(0, (total, current) => total + current.price!);
}
