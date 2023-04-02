import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final double size;
  final String asset;

  const Avatar({
    Key? key,
    required this.size,
    required this.asset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(size / 2),
        child: Image.asset(
          asset,
          width: size,
          height: size,
        ),
      ),
    );

    // return Container(
    //   width: size,
    //   height: size,
    //   decoration: BoxDecoration(
    //     shape: BoxShape.circle,
    //     image: DecorationImage(
    //       image: AssetImage(asset),
    //     ),
    //   ),
    // );
  }
}
