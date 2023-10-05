import 'package:flutter/material.dart';
import 'package:baseline_players/resources/themes/icons/baseline_icons.dart';
import 'package:baseline_players/resources/themes/text_theme/default_text_theme.dart';

class ActionSheet extends StatelessWidget {
  const ActionSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height *
          0.3, // Adjust this value to change the height
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Ready? Set? Match!',
                    style: defaultTextTheme.displaySmall?.copyWith(
                        color: Colors.black,
                        height: 1,
                        fontSize: 24.0,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.5),
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
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    child: ActionItem(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      icon: BaselineIcons.icon_tennis,
                      text: 'Record Match',
                    ),
                  ),
                  Expanded(
                    child: ActionItem(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icons.book_online_rounded,
                      text: 'Book a Court',
                    ),
                  ),
                  Expanded(
                    child: ActionItem(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      icon: BaselineIcons.icon_ball,
                      text: 'Training Session',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ActionItem extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final String text;

  const ActionItem({
    Key? key,
    required this.onTap,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 8.0),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(width: 1.0, color: Color(0xFFEFEFEF)),
            bottom: BorderSide(width: 1.0, color: Color(0xFFEFEFEF)),
            right: BorderSide(width: 1.0, color: Color(0xFFEFEFEF)),
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Color(0xFF2BBF58),
                radius: 30,
                child: Center(
                  child: Icon(icon, size: 28, color: Colors.white),
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: defaultTextTheme.displaySmall?.copyWith(
                      color: Colors.black,
                      height: 1.25,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.5),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
