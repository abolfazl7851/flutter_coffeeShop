
import 'package:coffee_shop/usecase/use_case.dart';

import '../../../core/resources/data_state.dart';
import '../repository/signup_repository.dart';


class SignUpUseCase extends UseCase{

 final SignupRepository signupRepository;


 SignUpUseCase(this.signupRepository);

  @override
  Future call(params) {

    return signupRepository.fetchSignUp(params) ;
  }

  // execute(String cityName) {
  //   return weatherRepositiry.fetchCurrentWeatherData(cityName) ;
  // }
}