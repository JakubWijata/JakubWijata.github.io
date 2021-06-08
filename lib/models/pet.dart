import 'dart:core';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pet.g.dart';

@JsonSerializable()
class Pet {
  var breed;
  var name;
  var age;
  var sex;
  var date_of_birth;
  var weight;
  var marks;
  var description;

  Pet({
    this.name,
    this.breed,
    this.age,
    this.sex,
    this.date_of_birth,
    this.weight,
    this.marks,
    this.description,
  });

  factory Pet.fromJson(Map<String, dynamic> json) => _$PetFromJson(json);

  Map<String, dynamic> toJson() => _$PetToJson(this);
}
