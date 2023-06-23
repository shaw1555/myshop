import 'package:flutter/material.dart';
import 'package:myshop/color_theme/color_theme.dart';
import 'package:myshop/data_constant/data_constant.dart';
import 'package:myshop/model/user_profile.dart';
import 'package:myshop/screens/my_profile.dart';
import 'package:myshop/screens/my_setting.dart';
import 'package:myshop/services/user_service.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  final String profile = 'Profile';
  final String setting = 'Setting';
  final UserService userService = UserService();
  late UserProfile userProfile;

  @override
  void initState() {
    super.initState();
    userProfile = userService.getUserProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: [
        DrawerHeader(
            decoration: BoxDecoration(
              color: ColorTheme.secondaryColorBg,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.account_circle,
                  size: 50,
                  color: ColorTheme.primaryColorFontOnBg,
                ),
                Text(
                  userProfile.userName,
                  style: TextStyle(
                      color: ColorTheme.primaryColorFontOnBg, fontSize: 24),
                ),
                Text(
                  DataConstant.appVersion,
                  style: TextStyle(color: ColorTheme.primaryColorFontOnBg),
                ),
              ],
            )),
        ListTile(
          leading: const Icon(Icons.account_circle),
          title: Text(profile),
          onTap: () {
            Navigator.pop(context); // Close the drawer
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MyProfile(
                          title: profile,
                        )));
          },
        ),
        ListTile(
          leading: const Icon(Icons.settings),
          title: Text(setting),
          onTap: () {
            Navigator.pop(context); // Close the drawer
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MySetting(title: setting)));
          },
        )
      ],
    ));
  }
}
