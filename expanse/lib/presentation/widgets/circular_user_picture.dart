import 'package:flutter/material.dart';

import '../../utils/constants/assets.dart';
import '../../utils/constants/colors.dart';

class CirculatUserPicture extends StatelessWidget {
  const CirculatUserPicture({
    super.key,
    this.radius,
  });

  final double? radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const ShapeDecoration(
        shape: CircleBorder(
          side: BorderSide(color: kPrimaryColor, width: 3),
        ),
      ),
      padding: const EdgeInsets.all(3),
      child: CircleAvatar(
        backgroundImage: const AssetImage(Assets.assetsImagesUserProfile),
        radius: radius,
      ),
    );
  }
}
