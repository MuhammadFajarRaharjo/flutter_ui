import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:threads/providers/dropdown_create_screen.dart';
import 'package:threads/routes/app_routes.dart';
import 'package:threads/utils/constant.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../utils/assets.dart';
import '../../widgets/height_spacer.dart';

class CreateScreen extends ConsumerWidget {
  const CreateScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final dropdownValue = ref.watch(dropdownCreateScreenProvider);
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushNamedAndRemoveUntil(
          context,
          AppRoutes.main,
          (route) => false,
        );
        return false;
      },
      child: Scaffold(
        appBar: _appBar(context),
        body: Padding(
          padding: const EdgeInsets.all(kDefaultMargin),
          child: Column(
            children: [
              TimelineTile(
                isFirst: true,
                afterLineStyle: const LineStyle(thickness: 2),
                indicatorStyle: const IndicatorStyle(
                  width: 40,
                  height: 40,
                  indicatorXY: 0.15,
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
                    Text(
                      'Muhammad',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    HeightSpacer.from5(),

                    //* INPUT TEXT
                    TextFormField(
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontSize: 14,
                          ),
                      autofocus: true,
                      decoration: const InputDecoration(
                        isDense: true,
                        isCollapsed: true,
                        border: InputBorder.none,
                        hintText: 'Mulai Utas',
                      ),
                    ),
                    //* CONTAINT POST IMAGE
                    SizedBox(
                      height: 100,
                      child: SvgPicture.asset(Assets.assetsIconsReceiptadd),
                    ),
                    HeightSpacer.from16(),
                  ],
                ),
              ),
              TimelineTile(
                isLast: true,
                indicatorStyle: const IndicatorStyle(
                  width: 40,
                  height: 40,
                  indicatorXY: 0,
                  indicator: CircleAvatar(
                    backgroundImage: AssetImage(
                      Assets.assetsImagesProfile, //* USER PROFILE
                    ),
                  ),
                  padding: EdgeInsets.only(top: 5, right: 15),
                ),
                endChild: TextFormField(
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontSize: 14,
                      ),
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 8),
                    isDense: true,
                    isCollapsed: true,
                    border: InputBorder.none,
                    hintText: 'Mulai Utas',
                  ),
                ),
              ),
              const Spacer(),
              //* BOTTOM BUTTON POST
              _bottomButton(dropdownValue, context, ref),
            ],
          ),
        ),
      ),
    );
  }

  Row _bottomButton(String dropdownValue, BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            borderRadius: BorderRadius.circular(12),
            elevation: 2,
            icon: const SizedBox(),
            value: dropdownValue,
            alignment: Alignment.topLeft,
            isDense: true,
            hint: Text(
              'Semua orang',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            selectedItemBuilder: (context) => [
              Text(
                'Semua orang dapat melihat',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Text(
                'Hanya kontak yang dapat melihat',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
            items: [
              DropdownMenuItem<String>(
                value: 'Semua orang',
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Semua orang',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const Icon(Icons.public),
                  ],
                ),
              ),
              DropdownMenuItem<String>(
                value: 'Hanya teman',
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Hanya teman',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const Icon(Icons.person),
                  ],
                ),
              ),
            ],
            onChanged: (value) {
              ref.read(dropdownCreateScreenProvider.notifier).setValue(value!);
            },
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Text(
            'Posting',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Colors.lightBlue.shade400),
          ),
        ),
      ],
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      leading: CloseButton(
        onPressed: () => Navigator.pushNamedAndRemoveUntil(
          context,
          AppRoutes.main,
          (route) => false,
        ),
      ),
      titleSpacing: 0,
      title: Text(
        'Utas Baru',
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      elevation: 1,
      surfaceTintColor: Colors.transparent,
    );
  }
}
