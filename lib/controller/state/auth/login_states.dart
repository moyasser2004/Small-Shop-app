import '../../../model/remote/auth/api_login.dart';

abstract class LoginStates {}

class LoginIniState extends LoginStates {}

class LoginSuccess extends LoginStates {
  final LoginModel loginModel;
  LoginSuccess(this.loginModel);
}

class LoginFail extends LoginStates {
  final String error;
  LoginFail(this.error);
}

class LoginLoading extends LoginStates {}
