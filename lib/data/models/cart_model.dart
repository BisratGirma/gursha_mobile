import 'dart:convert';

CartsModel getCartFromJson(String str) => CartsModel.fromJson(json.decode(str));

class CartsModel {
  int? id;
  String? name;

  int? price;

  String? img;
  int? quantity;
  bool? isExit;
  String? time;

  CartsModel(
      {this.id,
      this.name,
      this.price,
      this.img,
      this.quantity,
      this.isExit,
      this.time});

  CartsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];

    price = json['price'];

    img = json['img'];
    quantity = json['quantity'];
    isExit = json['isExit'];
    time = json['time'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['name'] = this.name;
  //   data['description'] = this.description;
  //   data['price'] = this.price;
  //   data['stars'] = this.stars;
  //   data['img'] = this.img;
  //   data['location'] = this.location;
  //   data['created_at'] = this.createdAt;
  //   data['updated_at'] = this.updatedAt;
  //   data['type_id'] = this.typeId;
  //   return data;
  // }
}
