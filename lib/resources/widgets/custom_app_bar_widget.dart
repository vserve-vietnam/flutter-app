import 'package:flutter/material.dart';
import 'package:flutter_app/resources/pages/profile_page.dart';
import 'package:nylo_framework/nylo_framework.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight +
      MediaQueryData.fromView(WidgetsBinding.instance.window).padding.top);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 0),
          child: Container(
            height: kToolbarHeight,
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.add_circle),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.person_add),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Text("Home".tr(),
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      textAlign: TextAlign.center),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // Replace this with your custom widget
                      GestureDetector(
                        onTap: () {
                          routeTo(ProfilePage.path,
                              pageTransition: PageTransitionType.bottomToTop);
                        },
                        child: Container(
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  "5,9423",
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              SizedBox(width: 6),
                              Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'public/assets/images/avatar.jpg'),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
