import 'package:equatable/equatable.dart';

class CurrentUserEntity extends Equatable {
  final String? name;
  final String? username;
  final String? email;
  final String? password;
  final String? token;

  // final int? authenticateState;
  final String? createdAt;
  final int? id;

  const CurrentUserEntity(
      {this.name,
      this.username,
      this.email,
      this.password,
      this.token,
      this.createdAt,
      this.id});

  @override
  // TODO: implement props
  List<Object?> get props => [name, username, email, createdAt, id, password,token];
}
