import 'package:f_jzshop/app/data/bloc/topping/topping_state.dart';
import 'package:f_jzshop/app/data/repository/repository.dart';
import 'package:f_jzshop/app/model/topping_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ToppingCubit extends Cubit<ToppingState>{
  ToppingCubit():super(ToppingLoading()){
    fetchToppings();
  }

  APIRepository repo = APIRepository();
  void fetchToppings() async {
    try {
      List<ToppingModel> toppings = await repo.fetchListTopping();
      emit(ToppingLoaded(toppings));
    } catch (ex) {
      emit(ToppingError(ex.toString()));
    }
  }
}