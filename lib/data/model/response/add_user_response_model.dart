// ignore: unused_import
// ignore_for_file: depend_on_referenced_packages

// ignore: unused_import
import 'package:meta/meta.dart';
import 'dart:convert';

class AddUserResponseModel {
  final String name;
  final String job;
  final String id;
  final DateTime createdAt;

  AddUserResponseModel({
    required this.name,
    required this.job,
    required this.id,
    required this.createdAt,
  });

  factory AddUserResponseModel.fromJson(String str) =>
      AddUserResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AddUserResponseModel.fromMap(Map<String, dynamic> json) =>
      AddUserResponseModel(
        name: json["name"],
        job: json["job"],
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "job": job,
        "id": id,
        "createdAt": createdAt.toIso8601String(),
      };
}
