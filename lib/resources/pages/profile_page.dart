import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/resources/themes/icons/baseline_icons.dart';
import 'package:flutter_app/resources/widgets/bottom_sheets/action_sheet_widget.dart';
import 'package:flutter_app/resources/widgets/custom_bottom_nav.dart';
import 'package:nylo_framework/nylo_framework.dart';
import '/app/controllers/controller.dart';

class ProfilePage extends NyStatefulWidget {
  final Controller controller = Controller();

  static const path = '/profile';

  ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends NyState<ProfilePage> {
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
      appBar: AppBar(title: Text("Profile")),
      body: SafeArea(
        child: Container(),
      ),
    );
  }
}
