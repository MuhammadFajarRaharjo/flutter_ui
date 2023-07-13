import 'package:ecommers_and_chat_app_with_bwa/presentation/routes/route_name.dart';
import 'package:ecommers_and_chat_app_with_bwa/presentation/widgets/custom_appbar.dart';
import 'package:ecommers_and_chat_app_with_bwa/presentation/widgets/width_spacer.dart';
import 'package:ecommers_and_chat_app_with_bwa/utils/constants/assets.dart';
import 'package:ecommers_and_chat_app_with_bwa/utils/constants/box_size.dart';
import 'package:ecommers_and_chat_app_with_bwa/utils/style/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../widgets/height_spacer.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: BoxSize.size30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            HeightSpacer.from20(),
            _accountTile(context),
            HeightSpacer.from20(),
            _generalTile(),
          ],
        ),
      ),
    );
  }

  Column _generalTile() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Account',
          style: AppStyle.poppinsSemiBold.copyWith(fontSize: 16),
        ),

        //* PRIVACY AND PILICY TILE
        HeightSpacer.from10(),
        ListTile(
          dense: true,
          visualDensity: VisualDensity.compact,
          contentPadding: EdgeInsets.zero,
          title: Text(
            'Privacy & Policy',
            style: AppStyle.poppinsRegular.copyWith(
              fontSize: 14,
              color: AppStyle.grey99,
            ),
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            color: AppStyle.grey99,
            size: 20,
          ),
        ),

        //* TERM OF SERVICE TILE
        HeightSpacer.from10(),
        ListTile(
          dense: true,
          visualDensity: VisualDensity.compact,
          contentPadding: EdgeInsets.zero,
          title: Text(
            'Term of Service',
            style: AppStyle.poppinsRegular.copyWith(
              fontSize: 14,
              color: AppStyle.grey99,
            ),
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            color: AppStyle.grey99,
            size: 20,
          ),
        ),

        //* RATE APP TILE
        HeightSpacer.from10(),
        ListTile(
          dense: true,
          visualDensity: VisualDensity.compact,
          contentPadding: EdgeInsets.zero,
          title: Text(
            'Rate App',
            style: AppStyle.poppinsRegular.copyWith(
              fontSize: 14,
              color: AppStyle.grey99,
            ),
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            color: AppStyle.grey99,
            size: 20,
          ),
        ),
      ],
    );
  }

  Column _accountTile(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Account',
          style: AppStyle.poppinsSemiBold.copyWith(fontSize: 16),
        ),

        //* EDIT DATA TILE
        HeightSpacer.from10(),
        ListTile(
          onTap: () => Navigator.pushNamed(context, RouteName.editProfile),
          dense: true,
          visualDensity: VisualDensity.compact,
          contentPadding: EdgeInsets.zero,
          title: Text(
            'Edit Data',
            style: AppStyle.poppinsRegular.copyWith(
              fontSize: 14,
              color: AppStyle.grey99,
            ),
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            color: AppStyle.grey99,
            size: 20,
          ),
        ),

        //* Your Orders TILE
        HeightSpacer.from10(),
        ListTile(
          dense: true,
          visualDensity: VisualDensity.compact,
          contentPadding: EdgeInsets.zero,
          title: Text(
            'Your Oders',
            style: AppStyle.poppinsRegular.copyWith(
              fontSize: 14,
              color: AppStyle.grey99,
            ),
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            color: AppStyle.grey99,
            size: 20,
          ),
        ),
        //* HELP TILE
        HeightSpacer.from10(),
        ListTile(
          dense: true,
          visualDensity: VisualDensity.compact,
          contentPadding: EdgeInsets.zero,
          title: Text(
            'Help',
            style: AppStyle.poppinsRegular.copyWith(
              fontSize: 14,
              color: AppStyle.grey99,
            ),
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            color: AppStyle.grey99,
            size: 20,
          ),
        ),
      ],
    );
  }

  CustomAppBar _appBar() {
    return CustomAppBar(
      title: Row(
        children: [
          WidthSpacer.from10(),
          const CircleAvatar(
            backgroundColor: AppStyle.darkNavy1F,
            backgroundImage: AssetImage(Assets.assetsImagesShopLogo),
            radius: 27,
          ),
          WidthSpacer.from10(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hallo, Alex',
                style: AppStyle.poppinsSemiBold.copyWith(fontSize: 22),
              ),
              Text(
                'Online',
                style: AppStyle.poppinsRegular.copyWith(
                  color: const Color(0xFF999999),
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(Assets.assetsSvgExit),
        ),
        WidthSpacer.from10(),
      ],
    );
  }
}
