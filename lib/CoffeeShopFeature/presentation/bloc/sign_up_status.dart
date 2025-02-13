

import 'package:flutter/cupertino.dart';

import '../../domain/entities/current_user_entity.dart';


@immutable
abstract class SignUpStatus{}

class SignUpStatusInitial extends SignUpStatus{}

class SignUpStatusLoading extends SignUpStatus{}

class SignUpStatusCompleted extends SignUpStatus{
  final CurrentUserEntity currentUserEntity ;

  SignUpStatusCompleted(this.currentUserEntity);
}

class SignUpStatusError extends SignUpStatus{
  final List<String> message ;

  SignUpStatusError(this.message);
}
