import '../Home_pages/const.dart';

class RegisterModel {
  late bool status;
  String? message;
  RegisterData? data;

  RegisterModel.fromJson(Map<String, dynamic> data) {
    status = data['status'];
    message = data['message'];
    this.data = data['data'] != null
        ? RegisterData.fromJson(data['data'])
        : RegisterData();
  }
}

class RegisterData {
  String? name;
  String? phone;
  String? email;
  int? id;
  String? image;
  String? token;

  RegisterData() {}

  RegisterData.fromJson(Map<String, dynamic> data) {
    id = data['id'];
    name = data['name'];
    email = data['email'];
    phone = data['phone'];
    image = data['image'];
    token = data['token'];
    tok = data['token'];
  }
}
