class AccountModel {
  late bool status;
  late AccountData data;

  AccountModel.fromJson(Map<String, dynamic> data) {
    status = data['status'];
    this.data = data['data'] != null
        ? AccountData.fromJson(data['data'])
        : AccountData();
  }
}

class AccountData {
  static dynamic tok;
  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  int? points;
  int credit = 0;
  String? token;

  AccountData() {}

  AccountData.fromJson(Map<String, dynamic> data) {
    id = data['id'];
    name = data['name'];
    email = data['email'];
    phone = data['phone'];
    image = data['image'];
    points = data['points'];
    credit = data['credit'];
    token = data['token'];
  }
}
