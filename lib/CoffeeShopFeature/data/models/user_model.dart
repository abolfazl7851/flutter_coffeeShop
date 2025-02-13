import '../../domain/entities/current_user_entity.dart';

class UserModel extends CurrentUserEntity {
  const UserModel({
    String? name,
    String? username,
    String? email,
    String? password,
    String? token,
    // int? authenticateState,
    String? createdAt,
    int? id,
  }) : super(
            name: name,
            username: username,
            email: email,
            password: password,
            token: token,
            // authenticateState: authenticateState,
            createdAt: createdAt,
            id: id);

  UserModel fromJson(dynamic json) {
    UserModel user = const UserModel();
    if (json['user'] != null) {
      user = UserModel(
          id: json['user']['id'],
          name: json['user']['name'],
          username: json['user'][username],
          email: json['user']['email'],
          password: "null",
          token: json['token'],
          createdAt: json['user']['create_at']);
    }
    return user;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['username'] = username;
    map['email'] = email;
    map['password'] = password;
    map['token'] = token;
    map['created_at'] = createdAt;
    map['id'] = id;
    return map;
  }
}
