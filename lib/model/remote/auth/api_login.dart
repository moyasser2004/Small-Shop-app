import '../../../view/screen/home_screen/const.dart';


class LoginModel {
  
  late bool status;
  String? message;
  LoginData? data;

  LoginModel.fromJson(Map<String, dynamic> data) {
    status = data['status'];
    message = data['message'];
    this.data = data['data'] != null ? LoginData.fromJson(data['data']) : LoginData();
  }
}


class LoginData {
  
  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  int? points;
  int? credit;
  String? token;

  LoginData() {}

  LoginData.fromJson(Map<String, dynamic> data) {
    id = data['id'];
    name = data['name'];
    email = data['email'];
    phone = data['phone'];
    image = data['image'];
    points = data['points'];
    credit = data['credit'];
    token = data['token'];
    tok = data['token'];
  }
}
