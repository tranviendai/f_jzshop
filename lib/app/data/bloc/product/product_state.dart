import 'package:f_jzshop/app/model/product_model.dart';

abstract class ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  List<ProductModel> products;
  ProductLoaded(this.products);
}
class ProductError extends ProductState{
  String? message;
  ProductError(this.message);
}
