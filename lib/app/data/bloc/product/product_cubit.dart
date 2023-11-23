import 'package:f_jzshop/app/data/bloc/product/product_state.dart';
import 'package:f_jzshop/app/data/repository/repository.dart';
import 'package:f_jzshop/app/model/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCubit extends Cubit<ProductState>{
  ProductCubit():super(ProductLoading()){
    fetchProduct();
  }

   APIRepository repo = APIRepository();
  void fetchProduct() async {
    try {
      List<ProductModel> categories = await repo.fetchListProduct();
      emit(ProductLoaded(categories));
    } catch (ex) {
      emit(ProductError(ex.toString()));
    }
  }
}