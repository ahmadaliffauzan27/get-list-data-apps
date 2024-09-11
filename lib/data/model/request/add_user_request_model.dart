// ignore: depend_on_referenced_packages, unused_import
import 'package:meta/meta.dart';
import 'dart:convert';

class AddUserRequestModel {
  final String name;
  final String job;

  AddUserRequestModel({
    required this.name,
    required this.job,
  });

  factory AddUserRequestModel.fromJson(String str) =>
      AddUserRequestModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AddUserRequestModel.fromMap(Map<String, dynamic> json) =>
      AddUserRequestModel(
        name: json["name"],
        job: json["job"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "job": job,
      };
}
