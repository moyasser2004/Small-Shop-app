import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/dio/DioHelper.dart';

import '../ApiData/Api_regester.dart';

abstract class RegisterStates {}

class RegisterIniState extends RegisterStates {}

class RegisterSuccess extends RegisterStates {
  final RegisterModel check;
  RegisterSuccess(this.check);
}

class RegisterFail extends RegisterStates {
  final String error;
  RegisterFail(this.error);
}

class RegisterLoading extends RegisterStates {}


class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterIniState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  void userRegister({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) {
    emit(RegisterLoading());
    DioHelper.postData(
      url: 'register',
      data: {
        'name': name,
        'phone': phone,
        'email': email,
        'password': password,
      },
    ).then((value) {
      RegisterModel registerState = RegisterModel.fromJson(value.data);
      emit(RegisterSuccess(registerState));
    }).catchError((error) {
       if (kDebugMode) {
         print("error ${error.toString()}");
       }
      emit(RegisterFail(error.toString()));
    });
  }

}
