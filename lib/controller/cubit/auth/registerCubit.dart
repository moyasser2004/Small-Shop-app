import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/core/class/dio_helper.dart';

import '../../../model/remote/auth/api_regester.dart';
import '../../state/auth/register-states.dart';



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
      RegisterModel registerState =
          RegisterModel.fromJson(value.data);
      emit(RegisterSuccess(registerState));
    }).catchError((error) {
      if (kDebugMode) {
        print("error ${error.toString()}");
      }
      emit(RegisterFail(error.toString()));
    });
  }
}
