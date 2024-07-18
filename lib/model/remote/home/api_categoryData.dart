class CategoriesModel {
  late bool status;
  late CategoriesData dat;

  CategoriesModel.fromJson(Map<String, dynamic> data) {
    status = data['status'];
    dat =  CategoriesData.fromJson(data['data']);
  }
}

class CategoriesData {
  List<CaData> data = [];

  CategoriesData.fromJson(Map<String, dynamic> data) {
    data['data'].forEach((e) {
      this.data.add(CaData.fromJson(e));
    });
  }
}

class CaData {
  late int id;
  late String name;
  late String image;

  CaData.fromJson(Map<String, dynamic> data) {
    id = data['id'];
    name = data['name'];
    image = data['image'];
  }
}
