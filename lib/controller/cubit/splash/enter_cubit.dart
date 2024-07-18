import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/controller/state/splash/enter_states.dart';

class EnterCubit extends Cubit<EnterStates> {
  EnterCubit() : super(EnterInitState());

  static EnterCubit get(context) => BlocProvider.of(context);

  final PageController pageController = PageController();
  int currentIndex = 0;

  void changeIndex(int index) {
    currentIndex = index;
    emit(EnterChangeScreen());
  }
}
