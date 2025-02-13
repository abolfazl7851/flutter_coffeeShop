

import 'package:coffee_shop/core/resources/data_state.dart';

import '../../data/models/user_model.dart';
import '../entities/current_user_entity.dart';


abstract class SignupRepository {

  Future<DataState<CurrentUserEntity>> fetchSignUp(UserModel userModel) ;
  // Future<DataState<ForecastDaysEntity>> fetchForecastDays(ForecastParams params) ;
  //
  // Future<List<Data>> fetchSuggestData(cityName) ;
}