import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:threads/providers/current_categories_aktivitas.dart';

import '../../utils/assets.dart';
import '../../utils/constant.dart';

class ActivityScreen extends ConsumerWidget {
  ActivityScreen({super.key});
  final List<String> categories = [
    'All',
    'Balasan',
    'Penyebutan',
    'Terverifikasi'
  ];

  @override
  Widget build(BuildContext context, ref) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          _appBar(context, ref),
          SliverList.builder(
            itemCount: 15,
            itemBuilder: (_, index) => ListTile(
              dense: true,
              leading: const CircleAvatar(
                backgroundImage: AssetImage(Assets.assetsImagesProfile),
              ),
              title: const Text('Nama User'),
              isThreeLine: true,
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Username',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: Colors.grey.shade700),
                  ),
                  Text(
                    'Followers',
                    style: Theme.of(context).textTheme.bodyMedium!,
                  ),
                ],
              ),
              trailing: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  visualDensity: VisualDensity.compact,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(kDefaultRadius),
                  ),
                  foregroundColor: Colors.black,
                ),
                onPressed: () {},
                child: const Text('Follow'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  SliverAppBar _appBar(BuildContext context, WidgetRef ref) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      pinned: true,
      elevation: 0,
      expandedHeight: 110,
      collapsedHeight: 70,
      scrolledUnderElevation: 0,
      flexibleSpace: FlexibleSpaceBar(
        expandedTitleScale: 1,
        titlePadding: const EdgeInsets.symmetric(
          // horizontal: kDefaultMargin,
          vertical: 10,
        ),
        background: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultMargin)
              .copyWith(top: 8),
          child: Text(
            'Aktivitas',
            style:
                Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 25),
          ),
        ),
        title: _categoires(context, ref),
      ),
    );
  }

  SizedBox _categoires(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(currentCategoriesAktivitasProvider);
    return SizedBox(
      height: 38,
      child: ListView.builder(
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) => GestureDetector(
          onTap: () => ref
              .read(currentCategoriesAktivitasProvider.notifier)
              .setValue(categories[index]),
          child: Container(
            margin: EdgeInsets.only(
              left: index == 0 ? kDefaultMargin : 0,
              right: kDefaultMargin,
            ),
            width: 100,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: selected == categories[index] ? Colors.black : null,
              borderRadius: BorderRadius.circular(kDefaultRadius),
              border: Border.all(),
            ),
            child: Text(
              categories[index],
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 14,
                    color: selected == categories[index]
                        ? Colors.white
                        : Colors.black,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
