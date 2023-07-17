import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:threads/utils/assets.dart';
import 'package:threads/utils/constant.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              pinned: true,
              elevation: 0,
              expandedHeight: 110,
              collapsedHeight: 70,
              scrolledUnderElevation: 0,
              flexibleSpace: FlexibleSpaceBar(
                expandedTitleScale: 1,
                titlePadding: const EdgeInsets.symmetric(
                  horizontal: kDefaultMargin,
                  vertical: 10,
                ),
                background: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: kDefaultMargin)
                          .copyWith(top: 8),
                  child: Text(
                    'Search',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontSize: 25),
                  ),
                ),
                title: TextFormField(
                  style: Theme.of(context).textTheme.bodyLarge,
                  decoration: InputDecoration(
                    filled: true,
                    isDense: true,
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(kDefaultRadius),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: SvgPicture.asset(
                      fit: BoxFit.none,
                      Assets.assetsIconsSearch,
                      width: 12,
                      height: 12,
                    ),
                    hintText: 'Search',
                  ),
                ),
              ),
              // title: TextFormField(
              //   style: Theme.of(context).textTheme.bodyLarge,
              //   decoration: InputDecoration(
              //     filled: true,
              //     isDense: true,
              //     contentPadding:
              //         const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
              //     border: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(kDefaultRadius),
              //       borderSide: BorderSide.none,
              //     ),
              //     prefixIcon: SvgPicture.asset(
              //       fit: BoxFit.none,
              //       Assets.assetsIconsSearch,
              //       width: 12,
              //       height: 12,
              //     ),
              //     hintText: 'Search',
              //   ),
              // ),
            ),
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
      ),
    );
  }
}
