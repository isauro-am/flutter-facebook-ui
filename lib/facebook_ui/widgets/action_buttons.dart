import 'package:flutter/material.dart';

import 'circle_button.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({
    Key? key,
    required this.color,
    required this.icon,
    required this.text,
  }) : super(key: key);

  final Color color;
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 15),
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: color.withOpacity(0.4),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleButton(color: color, icon: icon),
          Text(
            text,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold
            ),
          ),
        ],
      ),
    );
  }
}
