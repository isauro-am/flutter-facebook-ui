import 'package:flutter/material.dart';

import '../../icons/icons.dart';
import 'action_buttons.dart';

class QuickActions extends StatelessWidget {
  const QuickActions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        ActionButtons(
            icon: CustomIcons.photos,
            color: Color.fromARGB(255, 8, 126, 47),
            text: 'Gallery'),
        ActionButtons(
            icon: CustomIcons.userFriends,
            color: Color.fromARGB(255, 21, 73, 151),
            text: 'Tag Friends'),
        ActionButtons(
            icon: CustomIcons.videoCamera,
            color: Color.fromARGB(255, 192, 24, 24),
            text: 'Live'),
          
        // CircleButton(color: Colors.pink, icon: CustomIcons.location),
      ],
    );
  }
}


