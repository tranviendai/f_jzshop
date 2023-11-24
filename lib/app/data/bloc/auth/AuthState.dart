import 'package:f_jzshop/app/model/user_model.dart';


abstract class AuthState  {}

class AuthLoadingState extends AuthState{
}
class AuthGetToken extends AuthState{
  final String? token;
  AuthGetToken(this.token);
}
class AuthLoadedState extends AuthState{
  final UserModel? user;
  AuthLoadedState(this.user);
}

class AuthErorrState extends AuthState{
  String? message;
  AuthErorrState(this.message);
}
