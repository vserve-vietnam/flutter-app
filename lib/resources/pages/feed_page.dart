import 'package:flutter/material.dart';
import 'package:flutter_app/app/controllers/auth_controller.dart';
import 'package:flutter_app/bootstrap/extensions.dart';
import 'package:flutter_app/resources/themes/icons/baseline_icons.dart';
import 'package:flutter_app/resources/widgets/bottom_sheets/action_sheet_widget.dart';
import 'package:flutter_app/resources/widgets/custom_app_bar_widget.dart';
import 'package:flutter_app/resources/widgets/logo_widget.dart';
import '../../app/controllers/feed_controller.dart';
import '/resources/widgets/safearea_widget.dart';
import 'package:nylo_framework/nylo_framework.dart';
import '../../app/models/user.dart';
import 'package:flutter_app/resources/widgets/custom_bottom_nav.dart';
import 'package:flutter/services.dart';

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
    user = await Auth.user();
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        height: 112.0,
        width: 112.0,
        padding: const EdgeInsets.only(top: 34.0), // Lowering the button
        child: FloatingActionButton(
          onPressed: () {
            HapticFeedback.heavyImpact();
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return ActionSheet();
              },
            );
          },
          elevation: 0,
          highlightElevation: 0, // Remove shadow when button is pressed
          backgroundColor: Color(0xFFA5C94B),
          child: Icon(BaselineIcons.icon_tennis,
              size: 36), // Making the icon larger
          shape: CircleBorder(
              side: BorderSide(
                  color: Colors.white,
                  width:
                      4.0)), // Ensuring the button is round and adding a 4 pt white border
          // Making the button larger
          mini: false,
        ),
      ),
      bottomNavigationBar: CustomBottomNav(),
    );
  }

  bool get isThemeDark =>
      ThemeProvider.controllerOf(context).currentThemeId ==
      getEnv('DARK_THEME_ID');
}
