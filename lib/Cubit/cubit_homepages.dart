import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/ApiData/sharePrefrences.dart';
import 'package:shop/dio/DioHelper.dart';
import 'package:shop/Home_pages/Account.dart';
import 'package:shop/Home_pages/Search.dart';
import 'package:shop/Home_pages/category_page.dart';
import 'package:shop/Home_pages/const.dart';
import 'package:shop/Home_pages/home_pagse.dart';

import '../ApiData/Api_Account.dart';
import '../ApiData/Api_categoryData.dart';
import '../ApiData/Api_homData.dart';

abstract class HomeStates {}
class HomeIniState extends HomeStates {}

class HomeBottomNaBar extends HomeStates {}

//home
class HomeDataSuccess extends HomeStates {}

class HomeDataLoading extends HomeStates {}

class HomeDataError extends HomeStates {}

//category
class CategoriesDataSuccess extends HomeStates {}

class CategoriesDataLoading extends HomeStates {}

class CategoriesDataError extends HomeStates {}

//account
class AccountDataSuccess extends HomeStates {}

class AccountDataLoading extends HomeStates {}

class AccountDataError extends HomeStates {}



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
     Account(),
    const Search(),
  ];

  int currentIndex = 0;

  void getIndex(int index) {
    currentIndex = index;
    emit(HomeBottomNaBar());
    if(currentIndex==0){
         getHomeData();
    }else if(currentIndex==1){
        getCategoriesData();
    }else if(currentIndex==2){
       getAccountData();
    }
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
    SharedPreferencesHelper.getToken(key: "token").then((value) {
      check = value;
    }).catchError((onError) {});
    DioHelper.getData(
      url: 'profile',
      token: "${check ?? tok}",
    ).then((value) {
      accModel = AccountModel.fromJson(value.data);
      //save token data
      SharedPreferencesHelper.setToken(key: "token", value: tok.toString());
      emit(AccountDataSuccess());
    }).catchError((error) {
      emit(AccountDataError());
    });
  }

}
