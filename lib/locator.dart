


import 'package:coffee_shop/CoffeeShopFeature/domain/repository/getAllCoffees_repository.dart';
import 'package:coffee_shop/CoffeeShopFeature/domain/use_case/getAllCoffees_useCase.dart';
import 'package:coffee_shop/CoffeeShopFeature/presentation/bloc/Home/home_bloc.dart';
import 'package:get_it/get_it.dart';

import 'CoffeeShopFeature/data/repository/getAllCoffees_repositoryImpl.dart';
import 'CoffeeShopFeature/data/repository/signup_repositoryImpl.dart';
import 'CoffeeShopFeature/data/source/remote/api_provider.dart';
import 'CoffeeShopFeature/domain/repository/signup_repository.dart';
import 'CoffeeShopFeature/domain/use_case/signup_useCase.dart';
import 'CoffeeShopFeature/presentation/bloc/sign_up_bloc.dart';

GetIt locator = GetIt.instance;

setup() async {
  locator.registerSingleton<ApiProvider>(ApiProvider()) ;


  // final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  // locator.registerSingleton<AppDatabase>(database);

  /// repositories
  locator.registerSingleton<SignupRepository>(SignUpRepositoryImpl(locator())) ;
  locator.registerSingleton<GetAllCoffeesRepository>(GetAllCoffeesRepositoryImpl(locator())) ;
  // locator.registerSingleton<CityRepository>(CityRepositoryImpl(database.cityDao)) ;


  /// use case
  locator.registerSingleton<SignUpUseCase>(SignUpUseCase(locator())) ;
  locator.registerSingleton<GetAllCoffeesUseCase>(GetAllCoffeesUseCase(locator())) ;
  // locator.registerSingleton<GetForecastWeatherUsecase>(GetForecastWeatherUsecase(locator())) ;
  // locator.registerSingleton<GetAllCityUseCase>(GetAllCityUseCase(locator())) ;
  // locator.registerSingleton<SaveCityUseCase>(SaveCityUseCase(locator())) ;
  // locator.registerSingleton<GetCityUseCase>(GetCityUseCase(locator())) ;
  // locator.registerSingleton<DeleteCityUseCase>(DeleteCityUseCase(locator())) ;

  
  /// bloc
  locator.registerSingleton<SignUpBloc>(SignUpBloc(locator())) ;
  locator.registerSingleton<HomeBloc>(HomeBloc(locator())) ;
  // locator.registerSingleton<BookmarkBloc>(BookmarkBloc(locator(), locator(),locator(),locator()));



}