import 'package:flutter/material.dart';

import 'avatar.dart';

class WhatIsOnYourMind extends StatelessWidget {
  final String user;

  const WhatIsOnYourMind({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Avatar(size: 50, asset: user, borderSize: 2),
          const SizedBox(width: 10),
          const Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'What\'s on your mind?',
                border: InputBorder.none,
              ),
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
