class ToppingModel {
  int? id;
  String? name;
  String? image;
  double? price;
  bool? isCheck = false;

  ToppingModel({this.id, this.name, this.image, this.price});

  factory ToppingModel.fromJson(Map<String, dynamic> json) => ToppingModel(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        price: json["price"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "price": price,
      };
}
