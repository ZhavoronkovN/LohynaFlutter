import 'package:flutter/material.dart';

class AppDrawer extends Drawer {
  final BuildContext context;
  AppDrawer(this.context)
      : super(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: () =>
                        Navigator.pushReplacementNamed(context, "/profile"),
                    child: UserAccountsDrawerHeader(
                      decoration: BoxDecoration(
                        color: new Color(0xFF0062ac),
                      ),
                      accountName: Text(
                        "Roman Levkovych",
                        style: TextStyle(
                          fontSize: 22,
                        ),
                      ),
                      accountEmail: Text(
                        "roman",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      currentAccountPicture: CircleAvatar(
                          backgroundColor:
                              Theme.of(context).platform == TargetPlatform.iOS
                                  ? new Color(0xFF0062ac)
                                  : Colors.white,
                          backgroundImage: AssetImage("assets/profile.jpg")),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.radio),
                    title: Text('News'),
                    onTap: () =>
                        Navigator.pushReplacementNamed(context, '/news'),
                  ),
                  ListTile(
                    leading: Icon(Icons.person_outline),
                    title: Text('Profile'),
                    onTap: () =>
                        Navigator.pushReplacementNamed(context, '/profile'),
                  ),
                  ListTile(
                    leading: Icon(Icons.note),
                    title: Text('Notes'),
                    onTap: () =>
                        Navigator.pushReplacementNamed(context, '/notes'),
                  ),
                  ListTile(
                    leading: Icon(Icons.school),
                    title: Text('Marks'),
                  ),
                  ListTile(
                    leading: Icon(Icons.schedule),
                    title: Text('Timetable'),
                  ),
                  ListTile(
                    leading: Icon(Icons.forum),
                    title: Text('Messages'),
                  ),
                ],
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
              ),
            ],
          ),
        );
}
