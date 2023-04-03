import 'package:flutter/material.dart';

import '../../icons/icons.dart';
import 'action_buttons.dart';

class QuickActions extends StatelessWidget {
  const QuickActions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      alignment: Alignment.centerLeft,
      fit: BoxFit.scaleDown, // scaleDown scale only if not enough space
      child: Row(
        children: const [
          ActionButtons(
              icon: CustomIcons.photos,
              color: Color(0xff75a66f),
              text: 'Gallery'),
          ActionButtons(
              icon: CustomIcons.userFriends,
              color: Color(0xff1c89db),
              text: 'Tag Friends'),
          ActionButtons(
              icon: CustomIcons.videoCamera,
              color: Color(0xfff8756d),
              text: 'Live'),
            
          // CircleButton(color: Colors.pink, icon: CustomIcons.location),
        ],
      ),
    );
  }
}


