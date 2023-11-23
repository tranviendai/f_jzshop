import 'package:f_jzshop/app/data/bloc/category/category_state.dart';
import 'package:f_jzshop/app/data/repository/repository.dart';
import 'package:f_jzshop/app/model/category_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryCubit extends Cubit<CategoryState>{
  CategoryCubit() : super(CategoryLoading()){
    fetchCategory();
  }

  APIRepository repo = APIRepository();
  void fetchCategory() async {
    try {
      List<CategoryModel> categories = await repo.fetchListCategory();
      emit(CategoryLoaded(categories));
    } catch (ex) {
      emit(CategoryError(ex.toString()));
    }
  }
}