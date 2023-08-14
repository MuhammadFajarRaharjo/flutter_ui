import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:threads/utils/assets.dart';
import 'package:threads/utils/constant.dart';
import 'package:threads/widgets/width_spacer.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        _appBar(),
        _nameUser(context),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultMargin),
            child: Text(
              '0 Followers',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        ),
        _button(context),
        _tabBar(context),
      ],
    );
  }

  SliverPadding _tabBar(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(top: kDefaultMargin),
      sliver: SliverToBoxAdapter(
        child: DefaultTabController(
          length: 2,
          child: TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: Colors.black,
            indicatorWeight: 1,
            labelPadding: const EdgeInsets.only(bottom: 8),
            labelStyle: Theme.of(context).textTheme.bodyLarge,
            labelColor: Colors.black,
            unselectedLabelStyle: GoogleFonts.inter(),
            tabs: const [
              Text('Threads'),
              Text('Replies'),
            ],
          ),
        ),
      ),
    );
  }

  SliverToBoxAdapter _button(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultMargin)
            .copyWith(top: 10),
        child: Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(kDefaultRadius),
                  ),
                  visualDensity: VisualDensity.compact,
                ),
                child: Text(
                  'Edit profile',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ),
            const WidthSpacer(kDefaultMargin),
            Expanded(
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(kDefaultRadius),
                  ),
                  visualDensity: VisualDensity.compact,
                ),
                child: Text(
                  'Share profile',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _nameUser(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultMargin),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Zachary Nelson',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Row(
                    children: [
                      Text(
                        'zachary_nelson264',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      WidthSpacer.from10(),
                      Chip(
                        label: const Text('Threads.net'),
                        labelStyle: Theme.of(context).textTheme.bodySmall,
                        backgroundColor: Colors.grey.shade300,
                        visualDensity: VisualDensity.compact,
                        padding: EdgeInsets.zero,
                        side: BorderSide.none,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const CircleAvatar(
              backgroundImage: AssetImage(Assets.assetsImagesProfile),
              radius: 42,
            ),
          ],
        ),
      ),
    );
  }

  SliverPadding _appBar() {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultMargin),
      sliver: SliverAppBar(
        pinned: true,
        leading: SvgPicture.asset(Assets.assetsIconsGlobal),
        leadingWidth: 24,
        actions: [
          SvgPicture.asset(Assets.assetsIconsInstagram),
          const WidthSpacer(15),
          SvgPicture.asset(Assets.assetsIconsMore),
        ],
      ),
    );
  }
}
