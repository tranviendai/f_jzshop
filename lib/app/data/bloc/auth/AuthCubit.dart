import 'package:f_jzshop/app/data/bloc/auth/AuthState.dart';
import 'package:f_jzshop/app/data/repository/repository.dart';
import 'package:f_jzshop/app/model/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthLoadingState());
  static String token = "";
  APIRepository authRepo = APIRepository();

  void getUsers() async {
    try {
      UserModel user = await authRepo.getUser();
      emit(AuthLoadedState(user));
    } catch (ex) {
      emit(AuthErorrState(ex.toString()));
    }
  }
}
