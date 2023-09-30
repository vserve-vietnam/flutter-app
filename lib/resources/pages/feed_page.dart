import 'package:flutter/material.dart';
import 'package:flutter_app/app/controllers/auth_controller.dart';
import 'package:flutter_app/bootstrap/extensions.dart';
import 'package:flutter_app/resources/pages/start/welcome_page.dart';
import 'package:flutter_app/resources/widgets/custom_app_bar_widget.dart';
import 'package:flutter_app/resources/widgets/logo_widget.dart';
import '../../app/controllers/feed_controller.dart';
import '/bootstrap/helpers.dart';
import '/resources/widgets/safearea_widget.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:nylo_framework/theme/helper/ny_theme.dart';
import '../../app/models/user.dart';

class FeedPage extends NyStatefulWidget {
  @override
  final FeedController controller = FeedController();

  static const path = '/feed-page';

  FeedPage({Key? key}) : super(key: key);

  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends NyState<FeedPage> {
  User? user;

  @override
  init() async {
    super.init();
    user = Auth.user();
    print(user?.email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SafeAreaWidget(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Logo(),
              Text(
                "Logged in",
              ).displayMedium(context),
              SizedBox(height: 16),
              Text(user?.email ?? "No email", textAlign: TextAlign.center)
                  .titleMedium(context)
                  .setColor(context, (color) => color.primaryAccent),
              Text(
                user?.sessionId ?? "No token",
              ).bodyMedium(context).alignCenter(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Divider(),
                  Text(
                    "Framework Version: $nyloVersion",
                  )
                      .bodyMedium(context)
                      .setColor(context, (color) => Colors.grey),
                  MaterialButton(
                    child: Text(
                      "Logout",
                    )
                        .bodyLarge(context)
                        .setColor(context, (color) => color.surfaceContent),
                    onPressed: () async {
                      if (user != null) {
                        AuthController(context).logOut(user!);
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool get isThemeDark =>
      ThemeProvider.controllerOf(context).currentThemeId ==
      getEnv('DARK_THEME_ID');
}
