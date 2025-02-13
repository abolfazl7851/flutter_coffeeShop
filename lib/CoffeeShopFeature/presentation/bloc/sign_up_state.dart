part of 'sign_up_bloc.dart';



class SignUpState extends Equatable {

  SignUpStatus status ;


  SignUpState({required this.status});

SignUpState copyWith({
  SignUpStatus? newSignupStatus,
}){
  return SignUpState(status: newSignupStatus ?? status) ;
}

  @override
  // TODO: implement props
  List<Object?> get props => [status];

}
