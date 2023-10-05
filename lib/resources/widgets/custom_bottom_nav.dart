import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/bootstrap/helpers.dart';
import 'package:flutter_app/resources/themes/icons/baseline_icons.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:flutter_app/resources/widgets/bottom_sheets/menu_sheet_widget.dart';

class CustomBottomNav extends StatefulWidget {
  CustomBottomNav({Key? key}) : super(key: key);

  static String state = "custom_bottom_nav";

  @override
  _CustomBottomNavState createState() => _CustomBottomNavState();
}

class _CustomBottomNavState extends NyState<CustomBottomNav> {
  _CustomBottomNavState() {
    stateName = CustomBottomNav.state;
  }

  @override
  init() async {
    super.init();
  }

  @override
  stateUpdated(dynamic data) async {
    // e.g. to update this state from another class
    // updateState(CustomBottomNav.state, data: "example payload");
  }

  void _onItemTapped(int index) {
    if (index == 4) {
      HapticFeedback.mediumImpact();
      showModalBottomSheet(
          showDragHandle: true,
          context: context,
          isScrollControlled: true,
          builder: (BuildContext context) {
            return FractionallySizedBox(
              heightFactor: 0.7, // Set initial height to 60% of screen height
              child: MenuSheet(),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (index) {
        _onItemTapped(index); // Handle button tap
      },
      currentIndex: 0,
      enableFeedback: true,
      elevation: 1,
      selectedIconTheme: IconThemeData(color: Colors.black),
      selectedItemColor: Colors.black,
      iconSize: 24,
      type: BottomNavigationBarType.fixed,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Padding(
            padding: const EdgeInsets.only(top: 6.2),
            child: Icon(Icons.home_rounded),
          ),
          label: 'Trang chủ',
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: const EdgeInsets.only(top: 6.0),
            child: Icon(Icons.format_list_numbered_rounded),
          ),
          label: 'Xếp hạng',
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: const EdgeInsets.only(top: 6.0),
            child: Icon(Icons.circle), // This is the empty space
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: const EdgeInsets.only(top: 6.0),
            child: Icon(Icons.explore_outlined),
          ),
          label: 'Khám phá',
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: const EdgeInsets.only(top: 6.0),
            child: Icon(Icons.apps),
          ),
          label: 'Menu',
        ),
      ],
    );
  }
}
