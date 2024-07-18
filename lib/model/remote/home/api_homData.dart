

class HomeModel {
  late bool status;
  late HomeData data;

  HomeModel.fromJson(Map<String, dynamic> data) {
    status = data['status'];
    this.data = HomeData.fromJson(data['data']);
  }
}

class HomeData {
  List<Banners> banners = [];
  List<Products> products = [];

HomeData.fromJson(Map<String, dynamic> data) {
    data['banners'].forEach((e) {
      banners.add(Banners.fromJson(e));
    });
    data['products'].forEach((e) {
      products.add(Products.fromJson(e));
    });
  }
}


class Products {
  int? id;
  late var price;
  late var old_price;
  late var discount;
  String? image;
  String? name;
  bool? in_favoritesd;
  bool? in_cart;

  Products.fromJson(Map<String, dynamic> data) {
    id = data['id'];
    price = data['price'];
    old_price = data['old_price'];
    discount = data['discount'];
    image = data['image'];
    name = data['name'];
    in_favoritesd = data['in_favoritesd'];
    in_cart = data['in_cart'];
  }
}


class Banners {
  late int id;
  late String image;

  Banners.fromJson(Map<String, dynamic> data) {
    id = data['id'];
    image = data['image'];
  }
}
