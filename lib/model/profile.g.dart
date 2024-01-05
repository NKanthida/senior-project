// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile _$ProfileFromJson(Map<String, dynamic> json) => Profile(
      email: json['email'] as String,
      password: json['password'] as String,
      Phonenumber: json['Phonenumber'] as String,
      Firstname: json['Firstname'] as String,
      Lastname: json['Lastname'] as String,
      Username: json['Username'] as String,
      Otp: json['Otp'] as String,
      name_home: json['name_home'] as String,
      password_home: json['password_home'] as String, post_description: '', post_title: '',
    );

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'Firstname': instance.Firstname,
      'Username': instance.Username,
      'Lastname': instance.Lastname,
      'Phonenumber': instance.Phonenumber,
      'Otp': instance.Otp,
      'name_home': instance.name_home,
      'password_home': instance.password_home,
    };
