import 'dart:core';

class User {
  User(this.email, this.name, this.lastName, this.accountType, this.id);

  String name;
  String email;
  String lastName;
  String accountType;
  int id;

  User.fromJson(Map<String, dynamic> json)
      : name = json['first_name'],
        email = json['email'],
        lastName = json['last_name'],
        accountType = json['account_type'],
        id = json['id'];

  Map<String, dynamic> toJson() => {
        'email': email,
        'first_name': name,
        'last_name': lastName,
        'account_type': accountType,
        'id': id,
      };
}
