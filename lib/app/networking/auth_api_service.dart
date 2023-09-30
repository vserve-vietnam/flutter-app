import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '/app/networking/dio/base_api_service.dart';
import 'package:nylo_framework/nylo_framework.dart';
import '/app/models/user.dart';

class AuthApiService extends BaseApiService {
  AuthApiService({BuildContext? buildContext}) : super(buildContext);

  @override
  String get baseUrl {
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      // Check if it's a simulator or a real device
      bool isPhysicalDevice =
          !Platform.environment.containsKey('SIMULATOR_RUNTIME_VERSION');
      if (isPhysicalDevice) {
        // Replace '192.168.1.2' with your computer's local IP address
        return 'https://safely-discrete-racer.ngrok-free.app';
      }
    }
    return getEnv('API_BASE_URL');
  }

  Future<User?> signUp(String email, String password) async {
    return await network<User>(
      request: (request) => request.post("/api/v1/users", data: {
        "user": {
          "email": email,
          "password": password,
        }
      }),
    );
  }

  Future<User?> logIn(String email, String password) async {
    return await network<User>(
      request: (request) => request
          .post("/api/v1/auth", data: {"email": email, "password": password}),
    );
  }
}
