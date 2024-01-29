import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/ApiData/Api_Login.dart';
import 'package:shop/dio/DioHelper.dart';

abstract class LoginStates{}
class LoginIniState extends LoginStates{}

class LoginSuccess extends LoginStates{
   final LoginModel check;
  LoginSuccess(this.check);
}
class LoginFail extends LoginStates{
  final String error;
  LoginFail(this.error);
}
class LoginLoading extends LoginStates{}

class LoginCubit extends Cubit<LoginStates>{
  LoginCubit():super(LoginIniState());

  static LoginCubit get(context)=>BlocProvider.of(context);

  void userLogin({
        required String email,
        required String password,
   }){
    emit(LoginLoading());
    DioHelper.postData(
        url: 'login',
        data: {
          'email':email,
          'password':password,
        },
     ).then((value) {
      LoginModel logState = LoginModel.fromJson(value.data);
        emit(LoginSuccess(logState));
     }).catchError((error){
          if (kDebugMode) {
            print(error.toString());
          }
         emit(LoginFail(error.toString()));
     });
  }

}


