import 'controller.dart';
import 'package:flutter/widgets.dart';
import '../models/user.dart';
import '../networking/auth_api_service.dart';

class AuthController extends Controller {
  AuthApiService _authApiService;

  AuthController(BuildContext context)
      : _authApiService = AuthApiService(buildContext: context) {
    super.construct(context);
  }

  Future<User?> signUp(String email, String password) async {
    dynamic response = await _authApiService.signUp(email, password);
    User? user = User.fromJson(response);
    if (user != null) {
      // Handle successful sign up
      print(user);
      // You might want to update some state here or navigate to a new page
    } else {
      // Handle sign up error
      print('Signup was unsuccessful');
      // You might want to show an error message here
    }
    return user;
  }

  Future<User?> logIn(String email, String password) async {
    dynamic response = await _authApiService.logIn(email, password);
    User? user = User.fromJson(response);
    if (user != null) {
      // Handle successful log in
      // You might want to update some state here or navigate to a new page
    } else {
      // Handle log in error
      // You might want to show an error message here
    }
    return user;
  }
}
