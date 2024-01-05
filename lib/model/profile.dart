import 'package:json_annotation/json_annotation.dart';
part 'profile.g.dart';
@JsonSerializable()
class Profile{
  
  String email;
  String password;
  String Firstname;
  String Username;
  String Lastname;
  dynamic Phonenumber;
  dynamic Otp;
  String name_home;
  String password_home;
  String post_title;
  String post_description;

  
  Profile({
  required this.email,
  required this.password,
  required this.Phonenumber,
  required this.Firstname,
  required this.Lastname,
  required this.Username,
  required this.Otp,
  required this.name_home,
  required this.password_home,
  required this.post_title,
  required this.post_description
  });

  factory Profile.fromJson(Map<String, dynamic> json) => _$ProfileFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileToJson(this);
  
}

//น่าจะเป็นmap 
//if map{} it's not fic
