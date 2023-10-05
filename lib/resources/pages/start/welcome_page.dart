import 'package:flutter/material.dart';
import 'package:baseline_players/resources/pages/auth/signup_page.dart';
import 'package:baseline_players/resources/pages/auth/login_page.dart';
import 'package:baseline_players/resources/widgets/buttons/action_button.dart';
import 'package:nylo_framework/nylo_framework.dart';
import '/app/controllers/controller.dart';
import '/resources/themes/text_theme/default_text_theme.dart';

class WelcomePage extends NyStatefulWidget {
  final Controller controller = Controller();

  static const path = '/welcome';

  WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends NyState<WelcomePage> {
  @override
  init() async {
    super.init();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.black,
        ),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: MediaQuery.of(context).size.height * 1.95 / 3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("public/assets/images/intro2.jpg"),
                    fit: BoxFit.cover,
                  ),
                  border: Border(
                    bottom: BorderSide(
                      color: Color(0xFF2BBF58),
                      width: 5.0,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'welcome.title'.tr(),
                    style: defaultTextTheme.displayLarge?.copyWith(
                            color: Colors.white,
                            height: 1.1,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1) ??
                        DefaultTextStyle.of(context).style,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'welcome.subtitle'.tr(),
                    style: TextStyle(fontSize: 20, color: Color(0xFFECE8E3)),
                  ),
                  SizedBox(height: 20),
                  ActionButton(
                    onPressed: () {
                      routeTo(SignupPage.path,
                          pageTransition: PageTransitionType.fade);
                    },
                    text: 'Create your Tennis iD',
                    buttonColor: Color(0xFFDCE1E2),
                    textColor: Colors.black,
                  ),
                  SizedBox(height: 10),
                  ActionButton(
                    onPressed: () {
                      routeTo(LoginPage.path,
                          pageTransition: PageTransitionType.fade);
                    },
                    text: 'Login',
                    buttonColor: Colors.transparent,
                    textColor: Colors.white,
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
