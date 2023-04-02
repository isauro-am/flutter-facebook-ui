import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final Color color;
  final IconData icon;
  final bool showBadage;

  const CircleButton(
      {Key? key,
      required this.color,
      required this.icon,
      this.showBadage = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: 16,
                color: Colors.white,
              ),
            ),
            if (showBadage)
              Positioned(
                right: 0,
                top: 6,
                child: Container(
                  height: 15,
                  width: 15,
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 1.5,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
          ],
        ));
  }
}
