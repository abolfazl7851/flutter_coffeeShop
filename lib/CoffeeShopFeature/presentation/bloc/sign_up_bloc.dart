
import 'package:bloc/bloc.dart';
import 'package:coffee_shop/CoffeeShopFeature/presentation/bloc/sign_up_status.dart';

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../core/resources/data_state.dart';
import '../../data/models/user_model.dart';
import '../../domain/use_case/signup_useCase.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final SignUpUseCase signUpUseCase;
  SignUpBloc(this.signUpUseCase) : super(SignUpState(status: SignUpStatusInitial())) {
    on<LoadSignUpEvent>((event, emit) async {

      emit(state.copyWith(newSignupStatus: SignUpStatusLoading())) ;

      DataState dataState = await signUpUseCase(event.userModel);


      if(dataState is DataSuccess){
        emit(state.copyWith(newSignupStatus: SignUpStatusCompleted(dataState.data)));
      }
      if(dataState is DataFailed){

        emit(state.copyWith(newSignupStatus: SignUpStatusError(dataState.errors!))) ;
      }
    });
  }
}
