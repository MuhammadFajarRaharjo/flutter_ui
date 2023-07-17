import 'package:flutter/material.dart';
import 'package:threads/utils/assets.dart';
import 'package:threads/widgets/height_spacer.dart';
import 'package:threads/widgets/post_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              HeightSpacer.from10(),
              Image.asset(
                Assets.assetsImagesLogo,
                height: 40,
                width: 40,
              ),
              HeightSpacer.from10(),
              const PostTile(
                content:
                    'Designed by the PMMT Designer team, this is for educational purposes only and this design will not be used in any way. this is for educational purposes only and this design will not be used in any way.',
              ),
              const PostTile(
                content:
                    'Designed by the PMMT Designer team, this is for educational purposes only and this design will not be used in any way',
                imageContent: Assets.assetsImagesPost1,
              ),
              const PostTile(
                content:
                    'Designed by the PMMT Designer team, this is for educational purposes only and this design will not be used in any way',
                imageContent: Assets.assetsImagesPost2,
              ),
              const PostTile(
                content:
                    'Designed by the PMMT Designer team, this is for educational purposes only and this design will not be used in any way',
                imageContent: Assets.assetsImagesPost3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
