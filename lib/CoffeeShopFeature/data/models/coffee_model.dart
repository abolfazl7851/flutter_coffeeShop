import 'dart:ui';

import '../../domain/entities/coffee_entity.dart';

class CoffeeModel extends CoffeeEntity {
  const CoffeeModel({
    int? id,
    String? name,
    String? description,
    String? price,
    String? discount,
    int? coffeeShopId,
    String? image,
    int? likes,
  }) : super(
          id: id,
          name: name,
          description: description,
          price: price,
          discount: discount,
          coffeeShopId: coffeeShopId,
          image: image,
          likes: likes,
        );

  List<CoffeeModel> fromJson(dynamic json) {
    List<CoffeeModel> coffees = [];
    if (json['coffees'] != null) {
      json['coffees'].forEach((v) {
        coffees.add(CoffeeModel(
            id: v['id'],
            name: v['name'],
            description: v['description'],
            price: v['price'],
            discount: v['discount'],
            coffeeShopId: int.parse(v['coffeeShopId']),
            image: v['image'],
            likes: int.parse(v['likes'])
        ));
      });
    }

    return coffees;
  }



  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['description'] = description;
    map['price'] = price;
    map['discount'] = discount;
    map['coffeeShopId'] = coffeeShopId;
    map['image'] = image;
    map['likes'] = likes;

    return map;
  }
}
