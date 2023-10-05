import 'package:flutter/material.dart';
import 'package:flutter_app/resources/pages/profile_page.dart';
import 'package:flutter_app/resources/themes/icons/baseline_icons.dart';
import 'package:nylo_framework/nylo_framework.dart';

class MenuSheet extends StatelessWidget {
  const MenuSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var user = Auth.user();
    // var name = user.name;
    var email = user.email;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 2.0),
                  child: Image.asset(
                    getImageAsset("logo-new.png"),
                    height: 40,
                    width: 100,
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.close, size: 20),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 6),
          GestureDetector(
            onTap: () {
              routeTo(ProfilePage.path,
                  pageTransition: PageTransitionType.bottomToTop);
            },
            child: Card(
              elevation: 0,
              color: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 22,
                  backgroundImage:
                      AssetImage('public/assets/images/avatar.jpg'),
                ), // Set image from public/assets/images/avatar.jpg
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      email,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ), // Placeholder for profile name
                    Text(
                      'VTiD: 447820321',
                      style: TextStyle(
                          color: const Color.fromARGB(150, 255, 255, 255),
                          fontSize: 14),
                    ), // Added vtid
                  ],
                ),
                trailing: Icon(Icons.chevron_right,
                    color: Colors.white), // Added right chevron
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              children: <Widget>[
                ListTile(
                  tileColor: Color(0xFFDCE1E2),
                  leading: Icon(Icons.person),
                  title: Text('Find a coach'),
                  onTap: () => {},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(6),
                      topRight: Radius.circular(6),
                    ),
                  ),
                ),
                ListTile(
                  tileColor: Color(0xFFDCE1E2),
                  leading: Icon(Icons.group),
                  title: Text('Clubs & Communities'),
                  onTap: () => {},
                ),
                ListTile(
                  tileColor: Color(0xFFDCE1E2),
                  leading: Icon(Icons.rule_rounded),
                  title: Text('Baseline ranking rules'),
                  onTap: () => {},
                ),
                ListTile(
                  tileColor: Color(0xFFDCE1E2),
                  leading: Icon(BaselineIcons.icon_court, size: 14),
                  title: Text('Add tennis court'),
                  onTap: () => {},
                ),
                ListTile(
                  tileColor: Color(0xFFDCE1E2),
                  leading: Icon(BaselineIcons.icon_tennis, size: 18),
                  title: Text('Shop for gear'),
                  onTap: () => {},
                ),
                ListTile(
                  tileColor: Color(0xFFDCE1E2),
                  leading: Icon(BaselineIcons.icon_ranking, size: 14),
                  title: Text('Organise a tournament'),
                  onTap: () => {},
                ),
                ListTile(
                  tileColor: Color(0xFFDCE1E2),
                  leading: Icon(Icons.newspaper),
                  title: Text('Tennis news'),
                  onTap: () => {},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(6),
                      bottomRight: Radius.circular(6),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 12),
          Text(
            "Version 0.231",
            style: TextStyle(color: Colors.grey[400]),
          )
        ],
      ),
    );
  }
}
