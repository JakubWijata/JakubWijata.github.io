// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pet _$PetFromJson(Map<String, dynamic> json) {
  return Pet(
    name: json['name'],
    breed: json['breed'],
    age: json['age'],
    sex: json['sex'],
    date_of_birth: json['date_of_birth'],
    weight: json['weight'],
    marks: json['marks'],
    description: json['description'],
  );
}

Map<String, dynamic> _$PetToJson(Pet instance) => <String, dynamic>{
      'breed': instance.breed,
      'name': instance.name,
      'age': instance.age,
      'sex': instance.sex,
      'date_of_birth': instance.date_of_birth,
      'weight': instance.weight,
      'marks': instance.marks,
      'description': instance.description,
    };
