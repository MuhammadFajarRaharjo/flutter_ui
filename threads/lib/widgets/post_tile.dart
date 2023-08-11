import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:threads/utils/constant.dart';
import 'package:threads/widgets/width_spacer.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../utils/assets.dart';
import 'height_spacer.dart';

class PostTile extends StatelessWidget {
  const PostTile({super.key, required this.content, this.imageContent});
  final String content;
  final String? imageContent;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: kDefaultMargin)
          .copyWith(bottom: 20),
      child: Align(
        alignment: Alignment.topLeft,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //* USER PROFILE, USERNAME AND CONTENT POST
            TimelineTile(
              isFirst: true,
              afterLineStyle: const LineStyle(thickness: 2),
              indicatorStyle: const IndicatorStyle(
                width: 40,
                height: 40,
                indicatorXY: 0,
                indicator: CircleAvatar(
                  backgroundImage: AssetImage(
                    Assets.assetsImagesProfile, //* USER PROFILE
                  ),
                ),
                padding: EdgeInsets.only(bottom: 5, right: 15),
              ),
              endChild: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      //* USERNAME
                      Text(
                        'Muhammad',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const Spacer(),
                      //* TIME UPLOAD
                      const Text('3 Jam'),
                      const SizedBox(width: 10),
                      //* MORE BUTTON
                      GestureDetector(
                        child: const Icon(Icons.more_horiz),
                      ),
                    ],
                  ),
                  HeightSpacer.from5(),

                  //* CONTAINT POST TEXT
                  Text(
                    content,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),

                  //* CONTAINT POST IMAGE
                  if (imageContent != null) ...[
                    HeightSpacer.from10(),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(kDefaultRadius),
                      child: Image.asset(
                        imageContent!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],

                  HeightSpacer.from16(),

                  //* ACTION BUTTON
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(Assets.assetsIconsHeart),
                      WidthSpacer.from10(),
                      SvgPicture.asset(Assets.assetsIconsMessage),
                      WidthSpacer.from10(),
                      SvgPicture.asset(Assets.assetsIconsRepeat),
                      WidthSpacer.from10(),
                      SvgPicture.asset(Assets.assetsIconsSend2),
                      WidthSpacer.from10(),
                    ],
                  ),
                  HeightSpacer.from5(),
                ],
              ),
            ),
            //* COMENT USER PROFILE
            Row(
              children: [
                //* USER PROFILE COMMENT
                const SizedBox(
                  height: 40,
                  width: 40,
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    direction: Axis.vertical,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 2),
                        child: CircleAvatar(
                          backgroundImage: AssetImage(
                              Assets.assetsImagesProfile), //* USER PROFILE
                          radius: 9,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 2, bottom: 2),
                        child: CircleAvatar(
                          backgroundImage: AssetImage(
                              Assets.assetsImagesProfile), //* USER PROFILE
                          radius: 11,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 2),
                        child: CircleAvatar(
                          backgroundImage: AssetImage(
                              Assets.assetsImagesProfile), //* USER PROFILE
                          radius: 5,
                        ),
                      ),
                    ],
                  ),
                ),
                const WidthSpacer(18),
                Text(
                  '1 balasan - 25 suka',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
