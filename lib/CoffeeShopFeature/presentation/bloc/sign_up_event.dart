part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpEvent {}

class LoadSignUpEvent extends SignUpEvent {
  final UserModel userModel ;
  LoadSignUpEvent(this.userModel) ;
}


