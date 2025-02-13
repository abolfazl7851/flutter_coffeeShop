import 'package:coffee_shop/core/resources/data_state.dart';

import 'package:dio/dio.dart';

import '../../domain/entities/current_user_entity.dart';
import '../../domain/repository/signup_repository.dart';
import '../models/user_model.dart';
import '../source/remote/api_provider.dart';

class SignUpRepositoryImpl extends SignupRepository {
  late ApiProvider apiProvider;

  SignUpRepositoryImpl(this.apiProvider);

  @override
  Future<DataState<CurrentUserEntity>> fetchSignUp(UserModel userModel) async {
    try {
      Response response = await apiProvider.CallSignUp(userModel);

      if (response.statusCode == 201) {
        CurrentUserEntity userEntity =
            const UserModel().fromJson(response.data);
        return DataSuccess(userEntity);
      } else {
        List<String> errors = [];
        for (var s in response.data['errors']) {
          errors.add(s.toString());
        }
        return DataFailed(errors);
      }
    } catch (e) {
      List<String> errors = [];
      errors.add(e.toString());
      return DataFailed(errors);
    }
  }

// @override
// Future<DataState<ForecastDaysEntity>> fetchForecastDays(ForecastParams params) async {
//
//   try{
//
//     Response response = await apiProvider.SendRequest7DayForecast(params) ;
//
//     print(response.data) ;
//
//     if(response.statusCode == 200){
//       ForecastDaysEntity forecastDaysEntity = ForecastDaysModel.fromJson(response.data) ;
//
//       return DataSuccess(forecastDaysEntity) ;
//     }else {
//       return DataFailed("try Again...") ;
//     }
//   }catch (e){
//     return DataFailed("error ") ;
//
//   }
// }
}
