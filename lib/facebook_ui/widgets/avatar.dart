import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final double size;
  final String asset;
  final double borderSize;

  const Avatar({
    Key? key,
    required this.size,
    required this.asset,  this.borderSize = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(asset),
          fit: BoxFit.cover,
        ),
        color: Colors.grey[200],
        border: Border.all(
          width: borderSize,
          color: Colors.white
        )
      ),
    );
  }
}
