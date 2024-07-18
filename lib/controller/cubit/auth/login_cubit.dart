import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/core/class/dio_helper.dart';
import '../../../model/remote/auth/api_login.dart';
import '../../state/auth/login_states.dart';


class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginIniState());

  static LoginCubit get(context) => BlocProvider.of(context);

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(LoginLoading());
    DioHelper.postData(
      url: 'login',
      data: {
        'email': email,
        'password': password,
      },
    ).then((value) {
      LoginModel logState = LoginModel.fromJson(value.data);
      emit(LoginSuccess(logState));
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      emit(LoginFail(error.toString()));
    });
  }
}

