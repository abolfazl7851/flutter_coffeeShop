import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:coffee_shop/CoffeeShopFeature/data/models/coffee_model.dart';
import 'package:coffee_shop/CoffeeShopFeature/presentation/bloc/Home/home_status.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../core/resources/data_state.dart';
import '../../../domain/use_case/getAllCoffees_useCase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetAllCoffeesUseCase getAllCoffeesUseCase;
  HomeBloc(this.getAllCoffeesUseCase) : super(HomeState(status: HomeStatusLoading())) {
    on<LoadHomeEvent>((event, emit) async {

      emit(state.copyWith(newHomeStatus: HomeStatusLoading())) ;

      DataState dataState = await getAllCoffeesUseCase(event.coffeeModel);


      if(dataState is DataSuccess){
        emit(state.copyWith(newHomeStatus: HomeStatusCompleted(dataState.data)));
      }
      if(dataState is DataFailed){

        emit(state.copyWith(newHomeStatus: HomeStatusError(dataState.errors!))) ;
      }

    });
  }
}
