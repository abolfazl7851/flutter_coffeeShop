


import 'package:coffee_shop/CoffeeShopFeature/domain/entities/coffee_entity.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class HomeStatus{}

class HomeStatusLoading extends HomeStatus{}

class HomeStatusCompleted extends HomeStatus{
  final List<CoffeeEntity> coffees ;

  HomeStatusCompleted(this.coffees);
}

class HomeStatusError extends HomeStatus{
  final List<String> message ;

  HomeStatusError(this.message);
}