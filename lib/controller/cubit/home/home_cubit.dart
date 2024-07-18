import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/class/dio_helper.dart';
import '../../../core/class/sharePrefrences.dart';

import '../../../model/remote/home/Api_Account.dart';
import '../../../model/remote/home/Api_categoryData.dart';
import '../../../model/remote/home/Api_homData.dart';
import '../../../view/screen/home_screen/account_screen.dart';
import '../../../view/screen/home_screen/Search.dart';
import '../../../view/screen/home_screen/category_screen.dart';
import '../../../view/screen/home_screen/const.dart';
import '../../../view/screen/home_screen/home_screen.dart';
import '../../state/home/home_states.dart';


class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeIniState());

  static HomeCubit get(context) => BlocProvider.of(context);

  List<IconData> listOfIcons = [
    Icons.home_rounded,
    Icons.category_outlined,
    Icons.person_rounded,
    Icons.search,
  ];

  List<String> listOfStrings = [
    'Home',
    'Category',
    'Account',
    'Search'
  ];

  List<Widget> pages = [
    const Home(),
    const Categories(),
    const Account(),
    const Search(),
  ];

  int currentIndex = 0;

  void getIndex(int index) {
    currentIndex = index;
    if (currentIndex == 0) {
      getHomeData();
    } else if (currentIndex == 1) {
      getCategoriesData();
    } else if (currentIndex == 2) {
      getAccountData();
    }
    emit(HomeBottomNaBar());
  }

  //home data
  late HomeModel model;

  void getHomeData() {
    emit(HomeDataLoading());
    DioHelper.getData(url: 'home').then((value) {
      model = HomeModel.fromJson(value.data);
      emit(HomeDataSuccess());
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      emit(HomeDataError());
    });
  }

  //categories data
  late CategoriesModel categoriesModel;

  void getCategoriesData() {
    emit(CategoriesDataLoading());
    DioHelper.getData(url: 'categories').then((value) {
      categoriesModel = CategoriesModel.fromJson(value.data);
      emit(CategoriesDataSuccess());
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      emit(CategoriesDataError());
    });
  }

  //account data
  late AccountModel accModel;
  var check;

  void getAccountData() {
    emit(AccountDataLoading());
    check = SharedPreferencesHelper.getToken(key: "token");
    DioHelper.getData(
      url: 'profile',
      token: "${check ?? tok}",
    ).then((value) {
      accModel = AccountModel.fromJson(value.data);
      SharedPreferencesHelper.setString(key: "token", value: tok.toString());
      emit(AccountDataSuccess());
    }).catchError((error) {
      emit(AccountDataError());
    });
  }
  
}
