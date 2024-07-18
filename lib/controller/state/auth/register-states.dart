import '../../../model/remote/auth/api_regester.dart';


abstract class RegisterStates {}
class RegisterIniState extends RegisterStates {}


class RegisterSuccess extends RegisterStates {
  final RegisterModel registerModel;
  RegisterSuccess(this.registerModel);
}

class RegisterFail extends RegisterStates {
  final String error;
  RegisterFail(this.error);
}

class RegisterLoading extends RegisterStates {}