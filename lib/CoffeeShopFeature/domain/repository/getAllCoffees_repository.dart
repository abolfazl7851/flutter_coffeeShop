



import '../../../core/resources/data_state.dart';
import '../../data/models/coffee_model.dart';
import '../entities/coffee_entity.dart';

abstract class GetAllCoffeesRepository{

  Future<DataState<List<CoffeeEntity>>> fetchAllCoffees() ;

}