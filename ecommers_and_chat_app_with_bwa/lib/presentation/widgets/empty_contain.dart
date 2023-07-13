import 'package:ecommers_and_chat_app_with_bwa/presentation/providers/navigation_state.dart';
import 'package:ecommers_and_chat_app_with_bwa/presentation/routes/route_name.dart';
import 'package:ecommers_and_chat_app_with_bwa/utils/constants/navigation_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../utils/style/app_style.dart';
import 'height_spacer.dart';

class EmptyContain extends ConsumerWidget {
  const EmptyContain({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imageAsset,
  });
  final String title, subtitle, imageAsset;

  @override
  Widget build(BuildContext context, ref) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imageAsset,
            height: 80,
            width: 80,
          ),
          HeightSpacer.from20(),
          Text(
            title,
            textAlign: TextAlign.center,
            style: AppStyle.poppinsMedium.copyWith(fontSize: 16),
          ),
          HeightSpacer.from5(),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: AppStyle.poppinsRegular.copyWith(
              fontSize: 14,
              color: AppStyle.grey99,
            ),
          ),
          HeightSpacer.from20(),
          FilledButton(
            onPressed: () {
              ref
                  .read(navigationStateProvider.notifier)
                  .setPage(NavigationPage.home);
              Navigator.pushNamed(context, RouteName.main);
            },
            child: const Text('Explorer Store'),
          ),
        ],
      ),
    );
  }
}
