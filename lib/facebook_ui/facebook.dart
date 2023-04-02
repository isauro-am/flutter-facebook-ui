import 'package:facebook_ui/icons/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'widgets/circle_button.dart';
import 'widgets/quick_actions.dart';
import 'widgets/stories.dart';
import 'widgets/whats_mind.dart';

class FacebookUi extends StatelessWidget {
  const FacebookUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
        ),
        leadingWidth: 150,
        leading: SvgPicture.asset(
          'assets/logo/facebook.svg',
          color: Colors.blueAccent,
          height: 200,
          width: 150,
        ),
        actions: const [
          CircleButton(color: Colors.grey, icon: CustomIcons.search),
          CircleButton(
              color: Colors.grey, icon: CustomIcons.bell, showBadage: true),
          CircleButton(color: Colors.grey, icon: CustomIcons.userFriends),
          CircleButton(color: Colors.grey, icon: CustomIcons.messenger),
        ],
      ),
      body: ListView(
        // padding: const EdgeInsets.symmetric(horizontal: 10),
        children: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: WhatIsOnYourMind(
              user: 'assets/users/2.jpg',
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuickActions(),
          ),
          UserStories(),
        ],
      ),
    );
  }
}
