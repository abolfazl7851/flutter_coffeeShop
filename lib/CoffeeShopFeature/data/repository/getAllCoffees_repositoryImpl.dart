


import 'package:coffee_shop/CoffeeShopFeature/domain/entities/coffee_entity.dart';

import '../../data/models/coffee_model.dart';

import 'package:coffee_shop/core/resources/data_state.dart';
import 'package:dio/dio.dart';

import '../../domain/repository/getAllCoffees_repository.dart';
import '../source/remote/api_provider.dart';

class GetAllCoffeesRepositoryImpl extends GetAllCoffeesRepository {

  late ApiProvider apiProvider ;


  GetAllCoffeesRepositoryImpl(this.apiProvider);

  @override
  Future<DataState<List<CoffeeEntity>>> fetchAllCoffees() async {

    try{

      Response response = await apiProvider.CallGetAllCoffees();
      if(response.statusCode == 200){
        print(response.toString()) ;

        List<CoffeeEntity> coffees = const CoffeeModel().fromJson(response.data) ;
        return DataSuccess(coffees) ;
      }else{
        List<String> errors = [];
        errors.add('Error!');
        return DataFailed(errors) ;
      }
    }catch(e){
      List<String> errors = [] ;
      print(e) ;
      errors.add(e.toString()) ;
      return DataFailed(errors) ;
    }

  }

}