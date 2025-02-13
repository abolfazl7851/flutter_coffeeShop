import 'dart:ui';

import 'package:equatable/equatable.dart';

/// id : 23
/// name : "espresso"
/// description : "hgfh"
/// price : "10"
/// discount : "0"
/// coffeeShopId : 1
/// image : "espresso1.png"
/// likes : 0
/// created_at : "2023-09-15T08:43:46.000000Z"
/// updated_at : "2023-09-15T08:43:46.000000Z"

class CoffeeEntity extends Equatable {

  final int? id;
  final String? name;
  final String? description;
  final String? price;
  final String? discount;
  final int? coffeeShopId;
  final String? image;
  final int? likes;



  const CoffeeEntity({
    this.id,
    this.name,
    this.description,
    this.price,
    this.discount,
    this.coffeeShopId,
    this.image,
    this.likes,
  });


  @override
  // TODO: implement props
  List<Object?> get props => [];
}
