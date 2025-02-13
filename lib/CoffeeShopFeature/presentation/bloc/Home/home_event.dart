part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class LoadHomeEvent extends HomeEvent {
  final CoffeeModel coffeeModel ;
  LoadHomeEvent(this.coffeeModel) ;
}
