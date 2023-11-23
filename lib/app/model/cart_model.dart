import 'package:f_jzshop/app/model/product_model.dart';

class CartModel{
  List<ProductModel>? products;
  CartModel({this.products});

  double get totalPrice => products!.fold(0, (total, current) => total + current.price! * current.quantity! +
   current.topping!.fold(0, (previousValue, element) => previousValue + element.price! * current.quantity!));
}