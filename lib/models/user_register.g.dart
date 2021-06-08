// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_register.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserRegister _$UserRegisterFromJson(Map<String, dynamic> json) {
  return UserRegister(
    email: json['email'] as String,
    password: json['password'] as String,
    passwordConfirm: json['password_confirmation'] as String,
    firstName: json['first_name'] as String,
    lastName: json['last_name'] as String,
    professions:
        (json['professions'] as List)?.map((e) => e as String)?.toList(),
    accountType: json['account_type'] as String,
  );
}

Map<String, dynamic> _$UserRegisterToJson(UserRegister instance) =>
    <String, dynamic>{
      'first_name': instance.firstName,
      'email': instance.email,
      'last_name': instance.lastName,
      'password': instance.password,
      'password_confirmation': instance.passwordConfirm,
      'account_type': instance.accountType,
      'professions': instance.professions,
    };
