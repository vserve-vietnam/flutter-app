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
        child: SingleChildScrollView(
          child: Column(
            children: [
              // First section: Profile picture with name, bio, location and badges
              Container(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage:
                          NetworkImage('https://via.placeholder.com/150'),
                    ),
                    Text('Name'),
                    Text('Bio'),
                    Text('Location'),
                    Row(
                      children: [
                        Icon(Icons.star),
                        Icon(Icons.star),
                        Icon(Icons.star),
                      ],
                    ),
                  ],
                ),
              ),
              // Second section: Tabs: [Profile, Posts, Tournaments]
              DefaultTabController(
                length: 3,
                child: Column(
                  children: [
                    TabBar(
                      tabs: [
                        Tab(text: 'Profile'),
                        Tab(text: 'Posts'),
                        Tab(text: 'Tournaments'),
                      ],
                    ),
                    // Third section show tabs content
                    Expanded(
                      child: TabBarView(
                        children: [
                          Container(child: Text('Profile Content')),
                          Container(child: Text('Posts Content')),
                          Container(child: Text('Tournaments Content')),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
