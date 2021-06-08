import 'dart:core';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_register.g.dart';

@JsonSerializable()
class UserRegister {
  UserRegister(
      {@required this.email,
      @required this.password,
      @required this.passwordConfirm,
      @required this.firstName,
      @required this.lastName,
      @required this.accountType});

  @JsonKey(name: 'first_name')
  String firstName;

  String email;
  @JsonKey(name: 'last_name')
  String lastName;

  String password;
  @JsonKey(name: 'password_confirmation')
  String passwordConfirm;
  @JsonKey(name: 'account_type')
  String accountType;

  factory UserRegister.fromJson(Map<String, dynamic> json) =>
      _$UserRegisterFromJson(json);

  Map<String, dynamic> toJson() => _$UserRegisterToJson(this);
}
