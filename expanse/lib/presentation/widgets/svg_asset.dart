import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgAsset extends StatelessWidget {
  const SvgAsset(
    this.asset, {
    super.key,
    this.color,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
  });
  final String asset;
  final Color? color;
  final double? width, height;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      asset,
      colorFilter: ColorFilter.mode(
        color ?? Theme.of(context).iconTheme.color!,
        BlendMode.srcIn,
      ),
      width: width,
      height: height,
      fit: fit,
    );
  }
}
