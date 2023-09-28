import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';
import '/app/controllers/controller.dart';
import '/resources/themes/text_theme/default_text_theme.dart';
import '/resources/pages/home_page.dart';

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
          color: Color(0xFF174948),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: MediaQuery.of(context).size.height * 2 / 3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("public/assets/images/intro_image.png"),
                    fit: BoxFit.cover,
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
                    'Become part of the tennis community',
                    style: defaultTextTheme.displayLarge?.copyWith(
                            color: Colors.white,
                            height: 1.1,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5) ??
                        DefaultTextStyle.of(context).style,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'The official tennis ranking',
                    style: TextStyle(fontSize: 20, color: Color(0xFFECE8E3)),
                  ),
                  Text(
                    '& community app in vietnam',
                    style: TextStyle(fontSize: 20, color: Color(0xFFECE8E3)),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      routeTo(HomePage.path,
                          pageTransition: PageTransitionType.fade);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 14.0),
                      child: Text('Create your tennis identity',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFECE8E3),
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  OutlinedButton(
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 14.0),
                      child: Text('Login',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                    style: OutlinedButton.styleFrom(
                      primary: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      side: BorderSide(color: Colors.transparent),
                    ),
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
