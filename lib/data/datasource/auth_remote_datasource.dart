import 'package:aplikasi_sederhana/data/model/request/add_user_request_model.dart';
import 'package:aplikasi_sederhana/data/model/response/add_user_response_model.dart';
import 'package:dartz/dartz.dart';

import 'package:http/http.dart' as http;

import '../../common/constants/variables.dart';
import '../model/request/login_request_model.dart';
import '../model/response/auth_response_model.dart';

class AuthRemoteDataSource {
  // Future<Either<String, AuthResponseModel>> register(
  //     RegisterRequestModel data) async {
  //   final headers = {'Content-Type': 'application/json'};
  //   final response = await http.post(
  //     Uri.parse('${Variables.baseUrl}/api/auth/local/register'),
  //     body: data.toJson(),
  //     headers: headers,
  //   );

  //   if (response.statusCode == 200) {
  //     return right(AuthResponseModel.fromJson(response.body));
  //   } else {
  //     return left('Failed Register');
  //   }
  // }

  Future<Either<String, AuthResponseModel>> login(
      LoginRequestModel data) async {
    final headers = {'Content-Type': 'application/json'};
    final response = await http.post(
      Uri.parse('${Variables.baseUrl}/api/login'),
      body: data.toJson(),
      headers: headers,
    );

    if (response.statusCode == 200) {
      return right(AuthResponseModel.fromJson(response.body));
    } else {
      return left('Server Error');
    }
  }

  Future<Either<String, AddUserResponseModel>> addUsers(
      AddUserRequestModel request) async {
    final headers = {'Content-Type': 'application/json'};
    final response = await http.post(
      Uri.parse('${Variables.baseUrl}/api/users'),
      body: request.toJson(),
      headers: headers,
    );

    if (response.statusCode == 200) {
      return right(AddUserResponseModel.fromJson(response.body));
    } else {
      return left('Server Error');
    }
  }
}
