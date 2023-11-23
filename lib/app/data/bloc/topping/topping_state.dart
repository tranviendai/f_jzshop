import 'package:f_jzshop/app/model/topping_model.dart';

abstract class ToppingState {}

class ToppingLoading extends ToppingState {}

class ToppingLoaded extends ToppingState {
  List<ToppingModel>? topping;
  ToppingLoaded(this.topping);
}

class ToppingError extends ToppingState {
  String? message;
  ToppingError(this.message);
}
