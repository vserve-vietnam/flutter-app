import 'package:flutter/material.dart';
import '/app/networking/dio/base_api_service.dart';
import 'package:nylo_framework/nylo_framework.dart';
import '/app/models/user.dart';

class AuthApiService extends BaseApiService {
  AuthApiService({BuildContext? buildContext}) : super(buildContext);

  @override
  String get baseUrl => getEnv('API_BASE_URL');

  Future<User?> signUp(String email, String password) async {
    return await network<User>(
      request: (request) => request.post("/api/v1/users", data: {
        "user": {
          "email": email,
          "password": password,
          "name": "John Doe",
          "terms_of_service": true
        }
      }),
    );
  }

  Future<User?> logIn(String email, String password) async {
    return await network<User>(
      request: (request) =>
          request.post("/login", data: {"email": email, "password": password}),
    );
  }
}
