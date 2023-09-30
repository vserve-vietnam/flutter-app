import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/app/controllers/auth_controller.dart';
import 'package:flutter_app/resources/pages/auth/signup_page.dart';
import 'package:flutter_app/resources/widgets/utils/divider_widget.dart';
import 'package:nylo_framework/nylo_framework.dart';
import '/app/controllers/controller.dart';
import 'package:flutter_app/resources/themes/text_theme/default_text_theme.dart';
import 'package:flutter_app/resources/widgets/inputs/password_field.dart';
import 'package:flutter_app/resources/widgets/buttons/action_button.dart';
import 'package:flutter_app/resources/widgets/buttons/social_login_button.dart';

class LoginPage extends NyStatefulWidget {
  final Controller controller = Controller();

  static const path = '/login';

  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends NyState<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  late AuthController _authController;

  @override
  init() async {
    super.init();
    _authController = AuthController(context);
  }

  void _logIn() async {
    String email = _emailController.text;
    String password = _passwordController.text;
    await _authController.logIn(email, password);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Color(0xFF174948)),
            onPressed: () => Navigator.of(context).pop(),
            highlightColor: Colors.grey.withOpacity(0.4),
            splashColor: Colors.black
                .withOpacity(0.8), // Change this to your desired color
          ),
          backgroundColor: Color(0xFFEBE0D2),
        ),
        body: Container(
          padding: EdgeInsets.only(top: 0, right: 16, bottom: 16, left: 16),
          color: Color(0xFFEBE0D2), // Added background color
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // Add this line
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "login".tr(),
                        style: defaultTextTheme.displayLarge?.copyWith(
                              color: Color(0xFF174948),
                            ) ??
                            DefaultTextStyle.of(context).style,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Welcome back! To get started with recording matches, please login to your account.",
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF174948),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    SocialLoginButton(
                      icon: Icons.facebook,
                      text: "Continue with Facebook",
                      backgroundColor: Color(0xFF435A9E),
                      onPressed: () {
                        // Handle Facebook login
                      },
                    ),
                    SizedBox(height: 14),
                    SocialLoginButton(
                      icon: Icons.apple,
                      text: "Continue with Apple",
                      backgroundColor: Colors.black,
                      onPressed: () {
                        // Handle Apple login
                      },
                    ),
                    SizedBox(height: 35),
                    DividerWidget(
                      text: "or log in with your email address",
                    ),
                    SizedBox(height: 35),
                    CupertinoTextField(
                      controller: _emailController,
                      style: TextStyle(color: Color(0xFF231F20), fontSize: 16),
                      placeholder: "Your email address",
                      placeholderStyle:
                          TextStyle(fontSize: 14, color: Color(0xFF959A9A)),
                      padding:
                          EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Color(0xFF959A9A),
                        ),
                      ),
                    ),
                    SizedBox(height: 14),
                    PasswordField(controller: _passwordController),
                    SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      child: ActionButton(
                        onPressed: () {
                          // Add your action here
                          _logIn();
                        },
                        text: 'Log In',
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  routeTo(SignupPage.path,
                      navigationType: NavigationType.pushReplace,
                      pageTransition: PageTransitionType.fade);
                },
                child: Text.rich(
                  TextSpan(
                    text: "Don't have an account yet? ",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF231F20),
                    ),
                    children: <InlineSpan>[
                      TextSpan(
                        text: 'Sign up',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF231F20),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
